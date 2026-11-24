#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq python3-venv >/dev/null
python3 -m venv /opt/ddp && /opt/ddp/bin/pip -q install torch --index-url https://download.pytorch.org/whl/cpu
ln -sf /opt/ddp/bin/torchrun /usr/local/bin/torchrun; ln -sf /opt/ddp/bin/python /usr/local/bin/ddp-python
cat > /root/train_ddp.py <<'P'

import os, time, torch, torch.distributed as dist
from torch.nn.parallel import DistributedDataParallel as DDP
def main():
    dist.init_process_group("gloo")
    rank, world = dist.get_rank(), dist.get_world_size()
    torch.manual_seed(0)
    model = DDP(torch.nn.Sequential(torch.nn.Linear(64,128), torch.nn.ReLU(), torch.nn.Linear(128,1)))
    opt = torch.optim.SGD(model.parameters(), lr=0.01)
    x, y = torch.randn(4096,64), torch.randn(4096,1)
    shard = slice(rank, None, world)
    t = time.time()
    for epoch in range(5):
        opt.zero_grad(); loss = torch.nn.functional.mse_loss(model(x[shard]), y[shard]); loss.backward(); opt.step()
        if rank == 0: print(f"epoch {epoch} loss {loss.item():.4f} world_size {world}", flush=True)
    if rank == 0: print(f"done in {time.time()-t:.2f}s world_size {world}", flush=True)
    dist.destroy_process_group()
if __name__ == "__main__": main()

P

touch /tmp/lab-ready
