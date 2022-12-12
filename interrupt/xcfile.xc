/**************************************************************************************
 **************************************************************************************
 ______________________________________________________________________________________

  Company:
	Synapticon GmbH (https://www.synapticon.com/)
 ______________________________________________________________________________________

  File Name:
	parallel.xc
 ______________________________________________________________________________________

  Summary:
    This file contains the source code for printing "Hello world" on the terminal.
 ______________________________________________________________________________________

  Description:
	This file contains the source code for a self-practice task by Synapticon GmbH. 
    It implements the logic of the application's requirements, and it may call API 
    routines from a different section of the code, such as drivers, system services, 
    and middleware (if applicable). However, at present, this code is not calling 
    any of the system-specified APIs (such as the "USARTInitialize" and "TimerTasks"
    functions) of any of the modules in the system. To make the code development 
    environment-friendly, the majority of the code shall be using self-created drivers.

 **************************************************************************************
 **************************************************************************************/

 /**************************************************************************************
   No-Copyright (c):
	 No copyrights are being imposed on these software files. Information shall have
	 to be freely available for the rapid development of science to benefit humanity.
	 When the information is free, this is not a barrier to their progress. Therefore,
	 I, Aatif Shaikh, license you the right to use, modify, copy and distribute this
	 software however you desire.

	 Note*
	 Software and documentation are provided "as is" without warranty of any kind,
	 either express or implied, including without limitation, any warranty of
	 merchantability, title, non-infringement and fitness for a particular purpose.
	 In no event shall, I (Aatif Shaikh) liable or obligated under contract,
	 negligence, strict liability, contribution, breach of warranty, or other legal
	 equitable theory any direct or indirect damages or expenses including but not
	 limited to any incidental, special, indirect, punitive or consequential damages,
	 lost profits or lost data, cost of procurement of substitute goods, technology,
	 services, or any claims by third parties (including but not limited to any
	 defence thereof), or other similar costs.

  ************************************************************************************/

  /************************************************************************************
  ______                                            __      __                                     
 /      \                                          |  \    |  \                                    
|  $$$$$$\ __    __  _______    ______    ______  _| $$_    \$$  _______   ______   _______        
| $$___\$$|  \  |  \|       \  |      \  /      \|   $$ \  |  \ /       \ /      \ |       \       
 \$$    \ | $$  | $$| $$$$$$$\  \$$$$$$\|  $$$$$$\\$$$$$$  | $$|  $$$$$$$|  $$$$$$\| $$$$$$$\      
 _\$$$$$$\| $$  | $$| $$  | $$ /      $$| $$  | $$ | $$ __ | $$| $$      | $$  | $$| $$  | $$      
|  \__| $$| $$__/ $$| $$  | $$|  $$$$$$$| $$__/ $$ | $$|  \| $$| $$_____ | $$__/ $$| $$  | $$      
 \$$    $$ \$$    $$| $$  | $$ \$$    $$| $$    $$  \$$  $$| $$ \$$     \ \$$    $$| $$  | $$      
  \$$$$$$  _\$$$$$$$ \$$   \$$  \$$$$$$$| $$$$$$$    \$$$$  \$$  \$$$$$$$  \$$$$$$  \$$   \$$      
          |  \__| $$                    | $$                                                       
           \$$    $$                    | $$                                                       
            \$$$$$$                      \$$                                                       
                          ______                 __        __    __                                
                         /      \               |  \      |  \  |  \                               
                        |  $$$$$$\ ______ ____  | $$____  | $$  | $$                               
                        | $$ __\$$|      \    \ | $$    \ | $$__| $$                               
                        | $$|    \| $$$$$$\$$$$\| $$$$$$$\| $$    $$                               
                        | $$ \$$$$| $$ | $$ | $$| $$  | $$| $$$$$$$$                               
                        | $$__| $$| $$ | $$ | $$| $$__/ $$| $$  | $$                               
                         \$$    $$| $$ | $$ | $$| $$    $$| $$  | $$                               
                          \$$$$$$  \$$  \$$  \$$ \$$$$$$$  \$$   \$$                               
                                                                                                   
                                                                                                                                                                                                   
		        In order to be irreplaceable, one must always be different
  *************************************************************************************/

/* ----------------------------------------------------------------------------
 *                           Macros
 * ----------------------------------------------------------------------------
*/
/* ----------------------------------------------------------------------------
 *                           Includes
 * ----------------------------------------------------------------------------
*/
	/*Standard Header files*/
		#include "header.h"	
/* ----------------------------------------------------------------------------
 *                           External Function
 * ----------------------------------------------------------------------------
*/  
  extern "C" {  void GPIOInterrupt(void); void GPIOINTRWrapper(void); }        
/* ----------------------------------------------------------------------------
 *                           GLOBAL VARIABLE DECLARATION
 * ----------------------------------------------------------------------------
*/
    timer stTime1,stTime2;    
    int CallbackCount = 0;
/* ----------------------------------------------------------------------------
 *                           Fnction Definitions
 * ----------------------------------------------------------------------------
*/
/***********************************************************************
 * Function Name: Function1 
 * Arguments	  : void
 * Return Type	: void
 * Details	    : Just a callback function
 * *********************************************************************/
void CallbackFunction(void)
{
    CallbackCount++;
  	printf ("CALLBACK FUNCTION=%d\n\r",CallbackCount);
}
/***********************************************************************
 * Function Name: Function1 
 * Arguments	  : void
 * Return Type	: void
 * Details	    : Just a callback function
 * *********************************************************************/
void WhileOneLoop(void)
{
  uint64_t uiTimeTotal;
  uint32_t uiCount=0; 
  stTime1 :> uiTimeTotal;
  uiTimeTotal = uiTimeTotal + ui1Sec ;   
  while (SET)
  {
      stTime1 when timerafter(uiTimeTotal) :> void;    
      uiTimeTotal = uiTimeTotal + ui1Sec ;   
      uiCount++;
      printf("1S=%u\n\r",uiCount);    
  }    
}

/***********************************************************************
 * Function Name: Function1 
 * Arguments	  : void
 * Return Type	: void
 * Details	    : Just a callback function
 * *********************************************************************/
void WhileTwoLoop(void)
{
  uint64_t uiTimeTotal;
  uint32_t uiCount=0; 
  stTime2 :> uiTimeTotal;
  uiTimeTotal = uiTimeTotal + ui1Sec ;   
  while (SET)
  {
      stTime2 when timerafter(uiTimeTotal) :> void;    
      uiTimeTotal = uiTimeTotal + ui1Sec ;   
      uiCount++;
      printf("2S=%u\n\r",uiCount);    
  }    
}

/***********************************************************************
 * Function Name: Function1 
 * Arguments	  : void
 * Return Type	: void
 * Details	    : Just a callback function
 * *********************************************************************/
void FnParallel(void)
{
  printf("Para start\n");
  par
    {
      WhileOneLoop( );
      WhileTwoLoop( );
    }
}

/***********************************************************************
 * Function Name: main 
 * Arguments	  : void
 * Return Type	: int
 * Details	    : main function, start of the code
 * *********************************************************************/
int main ( )
{
  printf("start of the code!\n\r");
  GPIOInterrupt( );
  GPIOINTRWrapper( );
 /*control should not reach here*/   
 return RESET;   
}

  