using MyCard
using Test

@testset "MyCard.jl" begin
    @test SingleCard(4,4) == SingleCard(♠,4)
end
