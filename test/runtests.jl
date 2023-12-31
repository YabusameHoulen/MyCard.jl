using MyCard
using Test

SingleCard(3,4)
1+1
@testset "MyCard.jl" begin
    SingleCard(3,4) == SingleCard(♣,4)
end
