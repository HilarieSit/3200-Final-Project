# 3200-Final-Project
**Mechanical Engineering Project** </br>

1. Quarter Car Model <br/>
* RUN THIS FILE: **leastsquaresfit.m** - fits both spring and damping force data into a polynomial least squares curve </br>


2. Stimulation <br/>
* RUN THIS FILE: **Simulation.m** - solves solve system of ODEs with 4th order Runge-Kutta and forward Euler. Note that there are two dydtsys files: dydtsys10 (for V = 10 km/hr) and dydtsys40 (for V = 40 km/hr). Other than the difference in V value, both dydtsys files are the exact same. </br>

* calls the following: rk4sys.m, euler.m, dydtsys10.m, dydtsys40.m

3. Data Analysis </br>
* RUN THIS FILE: **finiteDifference.m**
* RUN THIS FILE: **zerocrossing.m** - solve for zero-crossing time via bsection method on a 5th order Lagrange Interpolating Polynomial  

* calls the following: lagrangeIP5.m, bisection.m
