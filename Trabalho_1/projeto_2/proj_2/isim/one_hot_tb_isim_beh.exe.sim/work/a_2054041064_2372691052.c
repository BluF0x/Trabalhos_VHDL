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
static const char *ng0 = "/home/ise/VHDL/Trabalho_1/projeto_2/proj_2/one_hot_tb.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_2054041064_2372691052_p_0(char *t0)
{
    char t17[16];
    char t18[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t19;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4999);
    t4 = 1;
    if (3U == 3U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(62, ng0);
    t8 = (10 * 1000LL);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4936U);
    t3 = (t0 + 5005);
    t7 = (t18 + 0U);
    t9 = (t7 + 0U);
    *((int *)t9) = 0;
    t9 = (t7 + 4U);
    *((int *)t9) = 2;
    t9 = (t7 + 8U);
    *((int *)t9) = 1;
    t19 = (2 - 0);
    t5 = (t19 * 1);
    t5 = (t5 + 1);
    t9 = (t7 + 12U);
    *((unsigned int *)t9) = t5;
    t9 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t2, t1, t3, t18);
    t10 = (t0 + 3024);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 3U);
    xsi_driver_first_trans_delta(t10, 0U, 3U, t8);
    t15 = (t0 + 3024);
    xsi_driver_intertial_reject(t15, t8, t8);

LAB3:    t1 = (t0 + 2944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t8 = (10 * 1000LL);
    t9 = (t0 + 5002);
    t11 = (t0 + 3024);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 3U);
    xsi_driver_first_trans_delta(t11, 0U, 3U, t8);
    t16 = (t0 + 3024);
    xsi_driver_intertial_reject(t16, t8, t8);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 3U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

}


extern void work_a_2054041064_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2054041064_2372691052_p_0};
	xsi_register_didat("work_a_2054041064_2372691052", "isim/one_hot_tb_isim_beh.exe.sim/work/a_2054041064_2372691052.didat");
	xsi_register_executes(pe);
}
