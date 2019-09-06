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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000001946988858_2297623829_init();
    unisims_ver_m_00000000004277362592_0142776733_init();
    unisims_ver_m_00000000003266096158_2593380106_init();
    work_m_00000000000545390900_2964965119_init();
    work_m_00000000000585146874_3150941549_init();
    work_m_00000000000213392517_3245280214_init();
    work_m_00000000000241320664_0950010788_init();
    xilinxcorelib_ver_m_00000000001358910285_1525619691_init();
    xilinxcorelib_ver_m_00000000001358910285_2535157499_init();
    xilinxcorelib_ver_m_00000000001687936702_4016793922_init();
    xilinxcorelib_ver_m_00000000000277421008_3255459759_init();
    xilinxcorelib_ver_m_00000000001603977570_3460693756_init();
    work_m_00000000002918048620_0810073686_init();
    work_m_00000000001469579290_1922904072_init();
    work_m_00000000003088018992_2568587179_init();
    work_m_00000000000240718325_0744919244_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000240718325_0744919244");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
