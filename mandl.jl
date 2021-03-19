using LightGraphs
using SimpleWeightedGraphs
using CSV
using DelimitedFiles

function mandl_graph()
    f = CSV.File("./data.csv")
    um = maximum(line.u for line in f)
    vm = maximum(line.v for line in f)
    N = max(um, vm)
    g = SimpleWeightedGraph(N)
    for line in f
        add_edge!(g, line.u, line.v, line.w)
    end
    g
end

mandl_od() = readdlm("./demand.csv", ',', Int)
