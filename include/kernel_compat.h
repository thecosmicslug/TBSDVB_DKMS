#ifndef _TBS_COMPAT_H__
#define _TBS_COMPAT_H__

#include <linux/version.h>



struct v4l2_tbs_data
{
	unsigned int baseaddr;
	unsigned int reg;
	unsigned int value;
};

//#define VIDIOC_TBS_G_CTL	_IOWR('V', BASE_VIDIOC_PRIVATE+1, struct v4l2_tbs_data)
//#define VIDIOC_TBS_S_CTL	_IOWR('V', BASE_VIDIOC_PRIVATE+2, struct v4l2_tbs_data)



#if LINUX_VERSION_CODE <= KERNEL_VERSION(5, 15, 0)
#define V4L2_MEMORY_FLAG_NON_COHERENT (1<<0)
#endif

#if LINUX_VERSION_CODE <= KERNEL_VERSION(5, 7, 0)
#define  VFL_TYPE_VIDEO VFL_TYPE_GRABBER
#endif

#endif
