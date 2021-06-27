#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "FluxR0.30Res2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions/FluxR" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --index 1.33 --flux-r-factor 0.3
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "AirR06.5Res2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions/AirR" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --index 1.33 --air-r-factor 6.5
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "PMLWlen0.95Res2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions/PMLWlen" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --index 1.33 -pml 0.95
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "WLenMax700Res2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions/WLenMax" -r 51.5 -pp "R" --wlen-range "np.array([500,700])" --index 1.33
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "WLenMin500Res2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions/WLenMin" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --index 1.33
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "RefRes2" -f "AuMieMediums/AllWaterTest/9)BoxDimensions" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --index 1.33
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "TFCell0.2Res2" -f "AuMieSphere/AuMie/13)TestPaper/4)PaperJCFit/TestTFCell/AllVac450650" -r 51.5 -pp "JC" --wlen-range "np.array([450,650])" --time-factor-cell 0.2
#mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "STFactor01.0Res2" -f "AuMieSphere/AuMie/13)TestPaper/4)PaperJCFit/TestSTFactor/AllVac450650" -r 51.5 -pp "JC" --wlen-range "np.array([450,650])" --second-time-factor 1
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.35Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .35 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.25Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .25 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.15Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .15 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.05Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .05 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.40Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .4 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.30Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .3 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.20Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .2 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.45Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .45 --index 1.33
mpirun --use-hwthread-cpus -np 6 python -m mpi4py ../AuMieSphere/u_au_mie_scattering.py -np 6 --parallel True -res 2 --from-um-factor 10e-3 -s "Courant0.10Res2" -f "AuMieMediums/AllWaterTest/6)Courant" -r 51.5 -pp "R" --wlen-range "np.array([500,650])" --courant .10 --index 1.33
