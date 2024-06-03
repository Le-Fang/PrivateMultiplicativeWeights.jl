using Pkg
Pkg.activate(".")
Pkg.instantiate()

using PrivateMultiplicativeWeights
using Statistics

mse_list = []
me_list = []
for i in 1:30
    d, n = 20, 1000
    data_matrix = rand(0:1, d ,n)
    mw = mwem(Parities(d, 3), Tabular(data_matrix))
    mse = mean_squared_error(mw)
    me = maximum_error(mw)

    push!(mse_list, mse)
    push!(me_list, me)
end

println(mean(mse_list))
println(mean(me_list))

