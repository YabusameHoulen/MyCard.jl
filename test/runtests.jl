using Card
using Test

@testset "Card.jl" begin
    SingleCard(3,4) == SingleCard(♣,4)
end
