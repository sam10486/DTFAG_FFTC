 //==================================================                                                                         
 //Writer     : shiyong wu                                                                                                  
 //Date       : 2020/06/18                                                                                                      
 //Note       : testbench for Merged Bank BFFT Processor                                                                       
 //==================================================                                                                         
                                                                                                                              
  `include "FFTP_pipe_syn.v"      
  `include "SRAM_SP_2048_128.v" 
  `include "ROM0_4096_64.v" 
  `include "ROM1_4096_128.v" 
  `include "ROM2_4096_128.v" 
  `include "ROM3_4096_128.v" 
  `include "ROM4_4096_128.v" 
  `include "ROM5_4096_128.v" 
  `include "ROM6_4096_128.v" 
  `include "ROM7_4096_128.v" 
  `include "IFFTR0_4096_64.v" 
  `include "IFFTR1_4096_128.v" 
  `include "IFFTR2_4096_128.v" 
  `include "IFFTR3_4096_128.v" 
  `include "IFFTR4_4096_128.v" 
  `include "IFFTR5_4096_128.v" 
  `include "IFFTR6_4096_128.v" 
  `include "IFFTR7_4096_128.v" 
  `include "/opt/CIC/share/CBDK_TSMC90GUTM_Arm_f1.0/CIC/Verilog/tsmc090.v"
                                                                      
  `include "reorderROM0.v"  
  `include "reorderROM1.v"  
  `include "reorderROM2.v"  
  `include "reorderROM3.v"  
  `include "ireorderROM0.v"  
  `include "ireorderROM1.v"  
  `include "ireorderROM2.v"  
  `include "ireorderROM3.v"  
  `include "H_b0ROM0.v"  
  `include "H_b0ROM1.v"  
  `include "H_b0ROM2.v"  
  `include "H_b0ROM3.v"  
  `include "H_b0ROM4.v"  
  `include "H_b0ROM5.v"  
  `include "H_b0ROM6.v"  
  `include "H_b0ROM7.v"  
  `include "H_b1ROM0.v"  
  `include "H_b1ROM1.v"  
  `include "H_b1ROM2.v"  
  `include "H_b1ROM3.v"  
  `include "H_b1ROM4.v"  
  `include "H_b1ROM5.v"  
  `include "H_b1ROM6.v"  
  `include "H_b1ROM7.v"  
                                                                                                                              
 `timescale 1 ns/1 ps                                                                                                         
                                                                                                                              
 module test_FFTP ;                                                                                                           
 parameter CYCLE = 5 ;                                                                                                       
 parameter P_WIDTH   = 64 ;  
 parameter test_data_index_over = 2048;
 parameter CP_WIDTH  = 22;  // original prime or small prime		2020/04/09	                                                
 parameter POINT_NUM = 65536; // total number of point                                                                        
 parameter BF_POINT_NUM = 16 ; // butterfly number of point                                                                    
 parameter INI_VALUE = 4096; //(POINT_NUM/BF_POINT_NUM)                                                                      
 parameter ADDR_VALUE =2048; //(POINT_NUM/(BF_POINT_NUM*2))                                                                   
                                                                                                                              
                                                                                                                              
 parameter golden_file = "./data/test_golden.txt";  
 parameter A_B0R0  = "./data/A_b0radix0.txt";  
 parameter A_B0R1  = "./data/A_b0radix1.txt";  
 parameter A_B0R2  = "./data/A_b0radix2.txt";  
 parameter A_B0R3  = "./data/A_b0radix3.txt";  
 parameter A_B0R4  = "./data/A_b0radix4.txt";  
 parameter A_B0R5  = "./data/A_b0radix5.txt";  
 parameter A_B0R6  = "./data/A_b0radix6.txt";  
 parameter A_B0R7  = "./data/A_b0radix7.txt";  
 parameter A_B1R0  = "./data/A_b1radix0.txt";  
 parameter A_B1R1  = "./data/A_b1radix1.txt";  
 parameter A_B1R2  = "./data/A_b1radix2.txt";  
 parameter A_B1R3  = "./data/A_b1radix3.txt";  
 parameter A_B1R4  = "./data/A_b1radix4.txt";  
 parameter A_B1R5  = "./data/A_b1radix5.txt";  
 parameter A_B1R6  = "./data/A_b1radix6.txt";  
 parameter A_B1R7  = "./data/A_b1radix7.txt";  
                                                                                                                              
                                                                                                                              
 wire                MulValid_out ;                                                                                            
 wire [CP_WIDTH-1:0] MulD0_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD1_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD2_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD3_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD4_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD5_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD6_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD7_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD8_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD9_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD10_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD11_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD12_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD13_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD14_out ;                                                                                              
 wire [CP_WIDTH-1:0] MulD15_out ;                                                                                              
                                                                                                                              
 reg  [CP_WIDTH-1:0] ExtB0_D0_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D1_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D2_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D3_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D4_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D5_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D6_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB0_D7_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D0_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D1_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D2_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D3_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D4_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D5_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D6_in ;                                                                                            
 reg  [CP_WIDTH-1:0] ExtB1_D7_in ;                                                                                            
 reg  [P_WIDTH-1:0] N_in ;                                                                                                    
 reg                ExtValid_in ;                                                                                             
 reg                rst_n ;                                                                                                   
 reg                clk ;                                                                                                     
                                                                                                                              
                                                                                                                              
 reg [CP_WIDTH-1:0]  golden_mem[0:POINT_NUM-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R0_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R1_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R2_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R3_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R4_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R5_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R6_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B0R7_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R0_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R1_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R2_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R3_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R4_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R5_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R6_mem[0:ADDR_VALUE-1];                                                                               
 reg [CP_WIDTH-1:0]  Ext_B1R7_mem[0:ADDR_VALUE-1];                                                                               
                                                                                                                              
 integer            i, j ,k ,ef,error;                                                                                             
 integer            gd; // golden_data                                                                                        
                                                                                                                              
     //read file                                                                                                              
     initial begin 
     	   $readmemh(A_B0R0,Ext_B0R0_mem);
     	   $readmemh(A_B0R1,Ext_B0R1_mem);
     	   $readmemh(A_B0R2,Ext_B0R2_mem);
     	   $readmemh(A_B0R3,Ext_B0R3_mem);
     	   $readmemh(A_B0R4,Ext_B0R4_mem);
     	   $readmemh(A_B0R5,Ext_B0R5_mem);
     	   $readmemh(A_B0R6,Ext_B0R6_mem);
     	   $readmemh(A_B0R7,Ext_B0R7_mem);
     	   $readmemh(A_B1R0,Ext_B1R0_mem);
     	   $readmemh(A_B1R1,Ext_B1R1_mem);
     	   $readmemh(A_B1R2,Ext_B1R2_mem);
     	   $readmemh(A_B1R3,Ext_B1R3_mem);
     	   $readmemh(A_B1R4,Ext_B1R4_mem);
     	   $readmemh(A_B1R5,Ext_B1R5_mem);
     	   $readmemh(A_B1R6,Ext_B1R6_mem);
     	   $readmemh(A_B1R7,Ext_B1R7_mem);
         //golden data                                                                                                        
         k = 0;                                                                                                               
         gd = $fopen(golden_file,"r");
         if(gd == 0) begin                                                                                                    
             $display("read file open error !");
             $finish;                                                                                                         
         end                                                                                                                  
         while(!$feof(gd))begin                                                                                               
             ef = $fscanf(gd , "%d",golden_mem[k]); 
             k  = k + 1;                                                                                                      
         end                                                                                                                  
     end                                                                                                                      
                                                                                                                              
 	//                                                                                                                          
 	FFTP u_FFTP(.MulValid_out(MulValid_out),                                                                                    
 				.MulD0_out(MulD0_out),                                                                                          
 				.MulD1_out(MulD1_out),                                                                                          
 				.MulD2_out(MulD2_out),                                                                                          
 				.MulD3_out(MulD3_out),                                                                                          
 				.MulD4_out(MulD4_out),                                                                                          
 				.MulD5_out(MulD5_out),                                                                                          
 				.MulD6_out(MulD6_out),                                                                                          
 				.MulD7_out(MulD7_out),                                                                                          
 				.MulD8_out(MulD8_out),                                                                                          
 				.MulD9_out(MulD9_out),                                                                                          
 				.MulD10_out(MulD10_out),                                                                                          
 				.MulD11_out(MulD11_out),                                                                                          
 				.MulD12_out(MulD12_out),                                                                                          
 				.MulD13_out(MulD13_out),                                                                                          
 				.MulD14_out(MulD14_out),                                                                                          
 				.MulD15_out(MulD15_out),                                                                                          
 				.ExtB0_D0_in(ExtB0_D0_in),                                                                                      
 				.ExtB0_D1_in(ExtB0_D1_in),                                                                                      
 				.ExtB0_D2_in(ExtB0_D2_in),                                                                                      
 				.ExtB0_D3_in(ExtB0_D3_in),                                                                                      
 				.ExtB0_D4_in(ExtB0_D4_in),                                                                                      
 				.ExtB0_D5_in(ExtB0_D5_in),                                                                                      
 				.ExtB0_D6_in(ExtB0_D6_in),                                                                                      
 				.ExtB0_D7_in(ExtB0_D7_in),                                                                                      
 				.ExtB1_D0_in(ExtB1_D0_in),                                                                                      
 				.ExtB1_D1_in(ExtB1_D1_in),                                                                                      
 				.ExtB1_D2_in(ExtB1_D2_in),                                                                                      
 				.ExtB1_D3_in(ExtB1_D3_in),                                                                                      
 				.ExtB1_D4_in(ExtB1_D4_in),                                                                                      
 				.ExtB1_D5_in(ExtB1_D5_in),                                                                                      
 				.ExtB1_D6_in(ExtB1_D6_in),                                                                                      
 				.ExtB1_D7_in(ExtB1_D7_in),                                                                                      
 				.N_in(N_in),                                                                                                    
 				.ExtValid_in(ExtValid_in),                                                                                      
 				.rst_n(rst_n),                                                                                                  
 				.clk(clk)                                                                                                       
 				) ;                                                                                                             
                                                                                                                              
                                                                                                                              
 	always #(0.5*CYCLE) clk = ~clk ;                                                                                            
                                                                                                                              
                                                                                                                              
     //FSDB                                                                                                                   
 	initial begin                                                                                                               
 		 $fsdbDumpfile("FFTP.fsdb"); 
 		 //$fsdbDumpvars ;                                                                                                        
          $dumpfile("FFTP.vcd");
          $shm_open("FFTP.shm");
          $shm_probe(test_FFTP.u_FFTP, "ASCM"); 
 		$fsdbDumpvars(3,test_FFTP) ;                                                                                          
 		// $fsdbDumpvars(3,test_FFTP); //top level signal                                                                       
 		//$fsdbDumpvars("+mda"); //all signal                                                         
 		//$fsdbDumpvars(1,test_DualECP); //top level signal                                                                     
 	end                                                                                                                         
                                                                                                                              
  initial  begin
     $sdf_annotate("FFTP_pipe.sdf",u_FFTP);
  end
                                                                                                                              
 	initial begin                                                                                                               
 		                                                                                                                        
 		clk = 1 ;                                                                                                               
 		rst_n = 1 ;                                                                                                             
 		ExtValid_in = 0 ;                                                                                                       
 		N_in = 64'hFFFFFFFF_00000001 ;                                                                                          
 		ExtB0_D0_in = 0 ;                                                                                                       
 		ExtB0_D1_in = 0 ;                                                                                                       
 		ExtB0_D2_in = 0 ;                                                                                                       
 		ExtB0_D3_in = 0 ;                                                                                                       
 		ExtB0_D4_in = 0 ;                                                                                                       
 		ExtB0_D5_in = 0 ;                                                                                                       
 		ExtB0_D6_in = 0 ;                                                                                                       
 		ExtB0_D7_in = 0 ;                                                                                                       
 		ExtB1_D0_in = 0 ;                                                                                                       
 		ExtB1_D1_in = 0 ;                                                                                                       
 		ExtB1_D2_in = 0 ;                                                                                                       
 		ExtB1_D3_in = 0 ;                                                                                                       
 		ExtB1_D4_in = 0 ;                                                                                                       
 		ExtB1_D5_in = 0 ;                                                                                                       
 		ExtB1_D6_in = 0 ;                                                                                                       
 		ExtB1_D7_in = 0 ;                                                                                                       
 		//                                                                                                                      
      #(CYCLE)                                                                                                                
 		rst_n = 0 ;                                                                                                             
 		                                                                                                                        
 		#(3.1*CYCLE)                                                                                                            
 		rst_n = 1 ;                                                                                                             
 		                                                                                                                        
 		#(2*CYCLE)                                                                                                              
 		ExtValid_in = 1 ;                                                                                                       
 		                                                                                                                        
 		#(0.1*CYCLE)                                                                                                            
 		// Load parameters                                                                                                      
 		                                                                                                                        
 		///*                                                                                                                    
 		//---test Mul all 1-----------------------                                                                              
 		// address=0~31                                                                                                         
 		for(j=0;j<ADDR_VALUE;j=j+1) begin                                                                                       
 			#(CYCLE)                                                                                                            
          ExtB0_D0_in  = Ext_B0R0_mem[j] ;                                                                                       
          ExtB0_D1_in  = Ext_B0R1_mem[j] ;                                                                                       
          ExtB0_D2_in  = Ext_B0R2_mem[j] ;                                                                                               
          ExtB0_D3_in  = Ext_B0R3_mem[j] ;                                                                                               
          ExtB0_D4_in  = Ext_B0R4_mem[j] ;                                                                                               
          ExtB0_D5_in  = Ext_B0R5_mem[j] ;                                                                                               
          ExtB0_D6_in  = Ext_B0R6_mem[j] ;                                                                                               
          ExtB0_D7_in  = Ext_B0R7_mem[j] ;                                                                                               
                                                                                                                         
                                                                                                                         
          ExtB1_D0_in  = Ext_B1R0_mem[j] ;                                                                                               
          ExtB1_D1_in  = Ext_B1R1_mem[j] ;                                                                                               
          ExtB1_D2_in  = Ext_B1R2_mem[j] ;                                                                                               
          ExtB1_D3_in  = Ext_B1R3_mem[j] ;                                                                                               
          ExtB1_D4_in  = Ext_B1R4_mem[j] ;                                                                                               
          ExtB1_D5_in  = Ext_B1R5_mem[j] ;                                                                                               
          ExtB1_D6_in  = Ext_B1R6_mem[j] ;                                                                                               
          ExtB1_D7_in  = Ext_B1R7_mem[j] ;                                                                                               
 		                                                                                                                        
 		end		                                                                                                                
 		//*/                                                                                                                    
 		                                                                                                                        
 		//                                                                                                                      
 		#(CYCLE)                                                                                                                
 		ExtValid_in = 0 ;                                                                                                       
 		error = 0;                                                                                                                        
 		///*                                                                                                                    
 		@(posedge MulValid_out)                                                                                                 
 		@(posedge clk)                                                                                                          
 		@(posedge clk)                                                                                                          
 		@(posedge clk)                                                                                                          
 		@(posedge clk)                                                                                                          
 		@(posedge clk)                                                                                                          
 		@(posedge clk)                                                                                                          
 		$display(" ==== Check Final Result  ==== ") ;          
 		for(i=0; i< test_data_index_over; i=i+1) begin                                                                       
 			#(CYCLE)        //Mul_Result_Golden                                                                                 
 			if(MulD0_out == golden_mem[16*i+0]) $display("MulD0_out[%d] = %d", 16*i,MulD0_out) ;
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD0_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i,MulD0_out,16*i,golden_mem[16*i]) ;
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			                //Mul_Result_Golden                                                                                 
 			if(MulD1_out == golden_mem[16*i+1]) $display("MulD1_out[%d] = %d", 16*i+1,MulD1_out) ; 
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD1_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+1,MulD1_out,16*i+1,golden_mem[16*i +1] ) ;
 				//$stop ;                                                                                                       
 			end                                                                                                                 
                             //Mul_Result_Golden                                                                              
 			if(MulD2_out == golden_mem[16*i+2]) $display("MulD2_out[%d] = %d", 16*i+2,MulD2_out) ;
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD2_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+2,MulD2_out,16*i+2,golden_mem[16*i + 2]) ;
 				//$stop ;                                                                                                       
 			end                                                                                                                 
                             //Mul_Result_Golden                                                                              
 			if(MulD3_out == golden_mem[16*i+3]) $display("MulD3_out[%d] = %d", 16*i+3,MulD3_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD3_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+3,MulD3_out,16*i+3,golden_mem[16*i + 3]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD4_out == golden_mem[16*i+4]) $display("MulD4_out[%d] = %d", 16*i+4,MulD4_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD4_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+4,MulD4_out,16*i+4,golden_mem[16*i + 4]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD5_out == golden_mem[16*i+5]) $display("MulD5_out[%d] = %d", 16*i+5,MulD5_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD5_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+5,MulD5_out,16*i+5,golden_mem[16*i + 5]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD6_out == golden_mem[16*i+6]) $display("MulD6_out[%d] = %d", 16*i+6,MulD6_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD6_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+6,MulD6_out,16*i+6,golden_mem[16*i + 6]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD7_out == golden_mem[16*i+7]) $display("MulD7_out[%d] = %d", 16*i+7,MulD7_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD7_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+7,MulD7_out,16*i+7,golden_mem[16*i + 7]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD8_out == golden_mem[16*i+8]) $display("MulD8_out[%d] = %d", 16*i+8,MulD8_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD8_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+8,MulD8_out,16*i+8,golden_mem[16*i + 8]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD9_out == golden_mem[16*i+9]) $display("MulD9_out[%d] = %d", 16*i+9,MulD9_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD9_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+9,MulD9_out,16*i+9,golden_mem[16*i + 9]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD10_out == golden_mem[16*i+10]) $display("MulD10_out[%d] = %d", 16*i+10,MulD10_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD10_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+10,MulD10_out,16*i+10,golden_mem[16*i + 10]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD11_out == golden_mem[16*i+11]) $display("MulD11_out[%d] = %d", 16*i+11,MulD11_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD11_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+11,MulD11_out,16*i+11,golden_mem[16*i + 11]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD12_out == golden_mem[16*i+12]) $display("MulD12_out[%d] = %d", 16*i+12,MulD12_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD12_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+12,MulD12_out,16*i+12,golden_mem[16*i + 12]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD13_out == golden_mem[16*i+13]) $display("MulD13_out[%d] = %d", 16*i+13,MulD13_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD13_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+13,MulD13_out,16*i+13,golden_mem[16*i + 13]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD14_out == golden_mem[16*i+14]) $display("MulD14_out[%d] = %d", 16*i+14,MulD14_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD14_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+14,MulD14_out,16*i+14,golden_mem[16*i + 14]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 			if(MulD15_out == golden_mem[16*i+15]) $display("MulD15_out[%d] = %d", 16*i+15,MulD15_out) ;  
 			else begin                                                                                                          
 				error = error + 1;
 				$display("MulD15_out[%d] = %d, Mul_Result_Golden[%d] = %d", 16*i+15,MulD15_out,16*i+15,golden_mem[16*i + 15]) ; 
 				//$stop ;                                                                                                       
 			end                                                                                                                 
 		end                                                                                                                     
 		$display("  ==== VERFICATION OF MULTIPLCIATION IS COMPLETED  ==== ") ;  
 		$display("Total error = %d",error) ; 
 		//*/                                                                                                                    
 		                                                                                                                        
 		#(10*CYCLE)   		                                                                                                    
 		$finish ;                                                                                                               
 	end                                                                                                                         
                                                                                                                              
 	                                                                                                                            
 	                                                                                                                            
 	                                                                                                                            
 endmodule                                                                                                                    
