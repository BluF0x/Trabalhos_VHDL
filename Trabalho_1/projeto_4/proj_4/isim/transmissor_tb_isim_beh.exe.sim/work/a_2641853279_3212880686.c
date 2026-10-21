/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/VHDL/Trabalho_1/projeto_4/proj_4/transmissor.vhd";



static void work_a_2641853279_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:    t13 = (t0 + 2152U);
    t14 = *((char **)t13);
    t15 = *((unsigned char *)t14);
    t16 = (t15 == (unsigned char)1);
    if (t16 != 0)
        goto LAB8;

LAB9:
LAB2:    t21 = (t0 + 3992);
    *((int *)t21) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 4088);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t13 = (t0 + 4088);
    t17 = (t13 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB2;

}

static void work_a_2641853279_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;

LAB0:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB24;

LAB26:
LAB25:    t2 = (t0 + 4008);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 2152U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)0);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)1);
    if (t3 != 0)
        goto LAB17;

LAB18:    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB22;

LAB23:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1352U);
    t12 = *((char **)t4);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB14;

LAB15:    t11 = (unsigned char)0;

LAB16:    if (t11 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 4152);
    t18 = (t4 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 4216);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t12 = (t8 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB12;

LAB14:    t4 = (t0 + 2152U);
    t15 = *((char **)t4);
    t16 = *((unsigned char *)t15);
    t17 = (t16 != (unsigned char)1);
    t11 = t17;
    goto LAB16;

LAB17:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2448U);
    t5 = *((char **)t2);
    t22 = *((int *)t5);
    t6 = (t22 == 0);
    if (t6 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t22 = *((int *)t4);
    t23 = (t22 - 1);
    t2 = (t0 + 2448U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    *((int *)t2) = t23;
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 2448U);
    t5 = *((char **)t2);
    t22 = *((int *)t5);
    t23 = (t22 - 7);
    t24 = (t23 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t22);
    t25 = (1U * t24);
    t26 = (0 + t25);
    t2 = (t4 + t26);
    t1 = *((unsigned char *)t2);
    t8 = (t0 + 4280);
    t12 = (t8 + 56U);
    t15 = *((char **)t12);
    t18 = (t15 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t1;
    xsi_driver_first_trans_fast_port(t8);

LAB20:    goto LAB9;

LAB19:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2448U);
    t8 = *((char **)t2);
    t2 = (t8 + 0);
    *((int *)t2) = 8;
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 4152);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB20;

LAB22:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4152);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t12 = (t8 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB9;

LAB24:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 4152);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t12 = (t8 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 4280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(68, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)2, 8U);
    t5 = (t0 + 4216);
    t8 = (t5 + 56U);
    t12 = *((char **)t8);
    t15 = (t12 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((int *)t2) = 8;
    goto LAB25;

}


extern void work_a_2641853279_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2641853279_3212880686_p_0,(void *)work_a_2641853279_3212880686_p_1};
	xsi_register_didat("work_a_2641853279_3212880686", "isim/transmissor_tb_isim_beh.exe.sim/work/a_2641853279_3212880686.didat");
	xsi_register_executes(pe);
}
