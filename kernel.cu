#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <memory>



/*
�����Ӧ�ó������ں���Ҫ��CPU���ܽ�������ô�����ϣ���ں���������CPU����ϵͳ�ڴ�ļ���CPU�ϡ��˽��豸�Ƿ�֧��
˫���ȸ��������Ϊ���Ӧ�ó������ø��豸��
ʹ��cudaDeviceProp�ṹ���е���������������ʶ���豸�Ƿ�֧��˫���Ȳ���������������ʱmajor��minor�����
major����1��minor����3����ô���豸��֧��˫���Ȳ�����
��ˣ������device_property�������������ֵ��CUDA���ṩ��cudaChooseDevice API,����ѡ������ض����Ե��豸��
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