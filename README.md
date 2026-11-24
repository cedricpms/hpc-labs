# HPC interactive labs (KillerCoda)

Browser labs for the Senior HPC Curriculum. Each folder is one KillerCoda scenario with steps and automatic checks.

| Scenario | Track |
|---|---|
| slurm-01-single-node | 05 Warewulf + Slurm |
| slurm-02-accounting-qos | 05 Warewulf + Slurm |
| monitoring-01-node-exporter | 06 Monitoring |
| containers-01-apptainer | 07 Containers |
| storage-01-nfs-mounts | 08 Storage |
| storage-02-parallel-io-ior | 08 Storage |
| benchmark-01-mpi-slurm | 09 Benchmarking |
| benchmark-02-reframe | 09 Benchmarking |
| rdma-01-soft-roce | 14 GPU & InfiniBand |
| ml-01-ddp-torchrun | 15 AI/ML |
| ml-02-ddp-slurm | 15 AI/ML |

## Publish (one time)
1. Create a free account at https://killercoda.com and open **Creator**.
2. Create a new **GitHub** repository (public is simplest), e.g. `hpc-labs`, and push this folder to it.
3. In KillerCoda Creator → *Repository*, connect the GitHub repository (it adds a deploy key and webhook; follow its instructions).
4. Every push updates the labs. Each scenario is then at `https://killercoda.com/<your-user>/scenario/<folder-name>`.

## Fixing a lab
Setup logs are in `/var/log/lab-setup.log` inside the lab. Edit the folder's `setup.sh`, `stepN/text.md` or `stepN/verify.sh`, push again.
