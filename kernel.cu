#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <memory>



/*
如果在应用程序中内核需要与CPU紧密交互，那么你可能希望内核运行在与CPU共享系统内存的集成CPU上。了解设备是否支持
双精度浮点操作并为你的应用程序设置该设备。
使用cudaDeviceProp结构体中的两个属性来帮助识别设备是否支持双精度操作。这两个属性时major和minor。如果
major大于1而minor大于3，那么该设备将支持双精度操作。
因此，程序的device_property结果包含这两个值。CUDA还提供了cudaChooseDevice API,帮助选择具有特定属性的设备。
*/


int main(void) {
	int device;
	cudaDeviceProp device_property;
	cudaGetDevice(&device);
	printf("ID of device:%d\n", device);
	memset(&device_property, 0, sizeof(cudaDeviceProp));
	device_property.major = 1;
	device_property.minor = 3;
	cudaChooseDevice(&device, &device_property);
	printf("ID of device which supports double precision is:%d\n", device);
	cudaSetDevice(device);
}