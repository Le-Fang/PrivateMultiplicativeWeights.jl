using Pkg
Pkg.activate(".")
Pkg.instantiate()

using PrivateMultiplicativeWeights
using Statistics

n = 10
largest_iterations = 10
for i in 1:largest_iterations
    for j in 1:n #run n times
        d, n = 30, 5000
        data_matrix = rand(0:1, d ,n)
        mw = mwem(Parities(d, 3), Tabular(data_matrix), MWParameters(iterations=i,))
    end
end

#read from convergence.txt, calculate the average
lines = readlines("convergence.txt")
avg_data = zeros(10)

for i in 1:n*largest_iterations
    value = parse(Float64, lines[i])
    avg_data[div(i + n - 1, n)] += value
end

avg_data = avg_data / n
open("convergence_estimation.txt", "w") do file
    for i in avg_data
        write(file, string(i, "\n"))
    end
end
