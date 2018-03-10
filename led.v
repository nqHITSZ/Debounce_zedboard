module led
(
    input GCLK,
    input BTNU,
    input BTNC,
    output reg [7:0]LD
);

wire db_tick;
debounce u_debounce
(
	.clk(GCLK),
    .rst_n(~BTNC), 
    .sw(BTNU),
	.db_level(),
    .db_tick(db_tick)
);

always@(posedge GCLK, posedge BTNC)
    if(BTNC)
        LD[3:0]<=0;
    else if(db_tick)
        LD[3:0]<=LD[3:0]+1; 

always@(posedge GCLK, posedge BTNC)
    if(BTNC)
        LD[7:4]<=0;
    else if(BTNU)
        LD[7:4]<=LD[7:4]+1; 
endmodule
