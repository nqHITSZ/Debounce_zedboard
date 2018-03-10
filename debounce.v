module debounce
(
	input clk,rst_n,
	input sw,
	output reg db_level,db_tick
);
// symbolic state declaration
localparam [1:0]
			ZERO =2'b00,
			WAIT0=2'b01,
			ONE  =2'b10,
			WAIT1=2'b11;
// number of counter bits (2^N *10ns)
localparam N=21;
// signal declaration
reg [1:0]state_reg,state_next;
reg [N-1:0] counter_reg,counter_next;
wire counter_zero;
reg counter_load,counter_decrement;
//FSMD   state and data registers
always@(posedge clk,negedge rst_n)
	if(~rst_n)
		begin
			state_reg<=ZERO;
			counter_reg<=0;
		end
	else
		begin
			state_reg<=state_next;
			counter_reg<=counter_next;
		end
//FSMD data path next logic
always@*
	if(counter_load)
		counter_next={N{1'b1}};
	else if(counter_decrement)
		counter_next=counter_reg-1;
	else
		counter_next=counter_reg;
//FSMD status signal
assign counter_zero=(counter_next==0);
//FSMD control path next logic
always@*
begin                     
	state_next=state_reg; //default state
	db_level=1'b0;        //default output
	db_tick=1'b0;         //default output
	counter_load=1'b0;    //default output
	counter_decrement=1'b0;    //default output
	case(state_reg)
		ZERO:
			begin
				if(sw==1'b1)
				begin
					counter_load=1'b1;
					state_next=WAIT1;
				end
			end		
		WAIT1:
			begin
				if(sw==1)
				begin
					counter_decrement=1'b1;
					if(counter_zero)
					begin
						state_next=ONE;
						db_tick=1'b1;
					end
				end	
				else
					state_next=ZERO;
			end	
		ONE:
			begin
				db_level=1'b1;
				if(sw==1'b0)
				begin
					counter_load=1'b1;
					state_next=WAIT0;
				end
			end		
		WAIT0:
			begin
				db_level=1'b1;
				if(sw==0)
				begin
					counter_decrement=1'b1;
					if(counter_zero)
					begin
						state_next=ZERO;
					end
				end	
				else
					state_next=ONE;
			 end	
		default: state_next=ZERO;
	endcase
	
end

endmodule
