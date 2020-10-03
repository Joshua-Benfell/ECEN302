/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "song.h"

XGpio GpioOutput; /* The driver instance for GPIO Device configured as O/P */

#define F_CLK 100000000.0
#define CONV 100000000.0 / 1024.0
#define DELAY 3000000

int setupAudio() {
	int Status;

	/*
	 * Initialize the GPIO driver so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */
	 Status = XGpio_Initialize(&GpioOutput, XPAR_AXI_GPIO_1_DEVICE_ID);
	 if (Status != XST_SUCCESS)  {
		  return XST_FAILURE;
	 }

	 /* Set the direction for all signals to be outputs */
	 XGpio_SetDataDirection(&GpioOutput, 1, 0x0);

	 /* Set the GPIO outputs to low */
	 XGpio_DiscreteWrite(&GpioOutput, 1, 0x0);
	 return XST_SUCCESS;
}

void tone(int freq, int length) {
	long note = F_CLK / (1024 * freq);
	XGpio_DiscreteWrite(&GpioOutput, 1, note);
	int timeDelay = (length * DELAY) / bpm;
	for(int Delay = 0; Delay < timeDelay; Delay++);
	XGpio_DiscreteClear(&GpioOutput, 1, 0x0);
	for(int Delay = 0; Delay < 800000; Delay++);
}


int main () 
{
	Xil_ICacheEnable();
	Xil_DCacheEnable();
	print("---Entering main---\n\r");




	setupAudio();



   /*
    * Peripheral SelfTest will not be run for axi_uartlite_0
    * because it has been selected as the STDOUT device
    */
	for (int i = 0; i < (sizeof(song)/sizeof(song[0])); i++){
		tone(song[i][0], song[i][1]);
	}



   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
