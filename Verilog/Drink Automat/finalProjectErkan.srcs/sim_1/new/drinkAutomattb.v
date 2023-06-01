`timescale 1ns / 1ps


module drinkAutomattb;
reg clk;
reg [9:0] card_currency;
reg [3:0] selection;
wire [4:0] water_storage_amount, coke_storage_amount, ice_tea_storage_amount, 
energy_drink_storage_amount;
wire [9:0] new_card_currency;
wire allow_access;

drinkAutomat UUT(clk, card_currency, selection, water_storage_amount, coke_storage_amount, ice_tea_storage_amount, energy_drink_storage_amount, new_card_currency, allow_access);

initial begin 
clk=0;
forever
#15 clk=~clk;
end

initial begin
card_currency=10'b0000001110;
selection = 1'd1;
#30;
card_currency=10'b0000001110;
selection = 2'd2;
#30;
card_currency=10'b0000001110;
selection = 2'd3;
#30;
card_currency=10'b0000001110;
selection = 3'd4;
#100;
end
endmodule
