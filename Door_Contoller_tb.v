module Door_Controller_tb();
  
  
//-----------------------------------------------------------------------
//                    Signals Decleration  
//-----------------------------------------------------------------------
  reg   Activate_tb;
  reg   UP_Max_tb;
  reg   DN_Max_tb;
  reg   CLK_tb;
  reg   RST_tb;
  wire  UP_M_tb;
  wire  DN_M_tb;
  
//-----------------------------------------------------------------------
//                         Initial BLock   
//-----------------------------------------------------------------------

initial
begin
  
  $dumpfile("Door_Controller.vcd") ;
  $dumpvars ;
  
  //                      initial values
  
    Activate_tb = 1'b0 ;  
    UP_Max_tb = 1'b0 ;    
    DN_Max_tb = 1'b0 ;
    CLK_tb = 1'b0 ;
    RST_tb = 1'b1 ;
    
    
  //                      TEST CASE 1
    
    $display ("TEST CASE 1") ;  
    #3
    Activate_tb = 1'b0 ;  
    UP_Max_tb = 1'b0 ;    
    DN_Max_tb = 1'b0 ;
    #7
    if(UP_M_tb != 0 && DN_M_tb != 0)
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
      
      
  //                      TEST CASE 2
    
    $display ("TEST CASE 2") ;  
    #3
    Activate_tb = 1'b1 ;  
    UP_Max_tb = 1'b1 ;    
    DN_Max_tb = 1'b0 ;
    #7
    if(UP_M_tb != 0 && DN_M_tb != 1)
      $display ("TEST CASE 2 IS FAILED") ;
    else
      $display ("TEST CASE 2 IS PASSED") ;   
      
      
  //                      TEST CASE 3
    
    $display ("TEST CASE 3") ;  
    #3
    Activate_tb = 1'b0 ;  
    UP_Max_tb = 1'b0 ;    
    DN_Max_tb = 1'b1 ;
    #7
    if(UP_M_tb != 0 && DN_M_tb != 0)
      $display ("TEST CASE 3 IS FAILED") ;
    else
      $display ("TEST CASE 3 IS PASSED") ;  
      
      
   //                      TEST CASE 4
    
    $display ("TEST CASE 4") ;  
    #3
    Activate_tb = 1'b1 ;  
    UP_Max_tb = 1'b0 ;    
    DN_Max_tb = 1'b1 ;
    #7
    if(UP_M_tb != 1 && DN_M_tb != 0)
      $display ("TEST CASE 4 IS FAILED") ;
    else
      $display ("TEST CASE 4 IS PASSED") ;    
      
      
    //                      TEST CASE 5
    
    $display ("TEST CASE 5") ;  
    #3
    Activate_tb = 1'b0 ;  
    UP_Max_tb = 1'b1 ;    
    DN_Max_tb = 1'b0 ;
    #7
    if(UP_M_tb != 0 && DN_M_tb != 0)
      $display ("TEST CASE 5 IS FAILED") ;
    else
      $display ("TEST CASE 5 IS PASSED") ; 
                  
        #100
$finish ;                                                                                      
end
//-----------------------------------------------------------------------
//                        Clock Generator  
//-----------------------------------------------------------------------
  
  always 
  begin
  #4 CLK_tb = 1'b1 ;
  #6 CLK_tb = 1'b0 ;
end
  
  
//-----------------------------------------------------------------------
//                       instaniate design instance   
//-----------------------------------------------------------------------

Door_Controller DUT (
.Activate(Activate_tb),
.Up_Max(UP_Max_tb),
.Dn_Max(DN_Max_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.Up_M(UP_M_tb),
.Dn_M(DN_M_tb)
  );
endmodule
