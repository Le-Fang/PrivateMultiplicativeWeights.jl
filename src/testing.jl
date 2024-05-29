using Pkg
Pkg.activate(".")
Pkg.instantiate()

using PrivateMultiplicativeWeights


d, n = 20, 1000
data_matrix = rand(0:1, d ,n)
data_matrix[3, :] = data_matrix[1, :] .* data_matrix[2, :]
mw = mwem(Parities(d, 3), Tabular(data_matrix))
println(maximum_error(mw))
