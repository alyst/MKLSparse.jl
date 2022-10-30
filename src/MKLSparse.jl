module MKLSparse

using LinearAlgebra, SparseArrays
using LinearAlgebra: BlasInt, BlasFloat, checksquare
using MKL_jll: libmkl_rt

# For testing purposes:
global const __counter = Ref(0)

function __init__()
    ccall((:MKL_Set_Interface_Layer, libmkl_rt), Cint, (Cint,), Base.USE_BLAS64 ? 1 : 0)
end

# Wrappers generated by Clang.jl
include("libmklsparse.jl")
include("types.jl")

# TODO: BLAS1

# BLAS2 and BLAS3
include("matdescra.jl")
include("generator.jl")
include("matmul.jl")

end # module
