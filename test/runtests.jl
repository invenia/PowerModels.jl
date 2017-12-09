using PowerModels
using Logging
# suppress warnings during testing
Logging.configure(level=ERROR)

using Ipopt
using Pajarito
using Juniper
using GLPKMathProgInterface
using SCS

using Base.Test

# default setup for solvers
ipopt_solver = IpoptSolver(tol=1e-6, print_level=0)
glpk_solver = GLPKSolverMIP()
juniper_solver = JuniperSolver(IpoptSolver(tol=1e-4, print_level=0), mip_solver=glpk_solver, log_levels=[])
#juniper_solver = JuniperSolver(IpoptSolver(tol=1e-4, print_level=0), mip_solver=glpk_solver)
pajarito_solver = PajaritoSolver(mip_solver=glpk_solver, cont_solver=ipopt_solver, log_level=0)
scs_solver = SCSSolver(max_iters=1000000, verbose=0)

include("common.jl")

include("matpower.jl")

include("output.jl")

include("modify.jl")

include("data.jl")

include("pf.jl")

include("opf.jl")

include("ots.jl")

include("tnep.jl")

include("multinetwork.jl")

include("docs.jl")

