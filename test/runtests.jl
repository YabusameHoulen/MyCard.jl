using MyCard
using Test

@testset "MyCard.jl" begin
    @test SingleCard(3,4) == SingleCard(♠,4)
end

