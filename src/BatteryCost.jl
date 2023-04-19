module BatteryCost
#TODO: Add exports for keyword constructors once you get that built
using JSON2



    include("Cell_Designer.jl")
    include("Cost_Inputs_Taxonomy.jl")
    include("Cost_Summary.jl")
    include("Manufacturing_Cost_Calculations.jl")
    include("Units.jl")
    include("default_constructors.jl")
    include("PBCM_IO.jl")

    export cost_calc
    export cell
   

end


