#include <iostream>
#include "NTT.h"
#include "NTTSPMB.h"
#include "SPMB.h"
#include "BitOperate.h"
#include "DTFAG.h"

using namespace std;

void DTFAG::DTFAG_DIF_MixedRadix () {
    //------- radix sel-----
    int radix_r1 = 16;
    int radix_r2 = 16;
    unsigned long fft_point = pow(radix_r1, 3) * radix_r2;
    ZZ fft_prime ;
    ZZ fft_twiddle_65536 ;
    ZZ fft_twiddle ;
    long difference_length = 65536 / fft_point ;
    conv(fft_prime, "18446744069414584321"); // prime number
    conv(fft_twiddle_65536, "14603442835287214144"); // twiddle factor based setting by main.cc
    
    PowerMod(fft_twiddle,fft_twiddle_65536,difference_length,fft_prime);
    cout << "fft_twiddle = " << fft_twiddle << ", fft_prime = " << fft_prime << endl;
    //-----------------------
    
    SPMB spmb;
    BitOperate number_complement, DecToBin;

    int MA0 = 0;
    int MA1 = 0;
    int MA2 = 0;
    int MA_MixedRadix = 0;
    int arr_size = radix_r1 * radix_r1;

    //int v1, v2;
    //int v0[radix_r1] = {0};
    vector<ZZ > v0;
    vector<ZZ > v1, v2;
    vector<ZZ > v_MixedRadix;

    v0.resize(radix_r1);
    v1.resize(radix_r1);
    v2.resize(radix_r1);
    v_MixedRadix.resize(radix_r1);

    //int Tw0[radix_r1] = {0};
    //int Tw1, Tw2;
    vector<ZZ > Tw0;
    vector<ZZ > Tw1, Tw2;

    Tw0.resize(radix_r1);
    Tw1.resize(radix_r1);
    Tw2.resize(radix_r1);

    NTTSPMB NTTSPMB;
    std::ofstream DTFAG_DIF_MixedRadix("./ROM_golden/DTFAG_DIF_MixedRadix.txt");
    //---------------ZZ to bin-----------------
    // ROM0
    std::ofstream Bin_DTFAG_DIF_ROM0_B0("./ROM0/DTFAG_ROM0_B0.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B1("./ROM0/DTFAG_ROM0_B1.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B2("./ROM0/DTFAG_ROM0_B2.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B3("./ROM0/DTFAG_ROM0_B3.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B4("./ROM0/DTFAG_ROM0_B4.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B5("./ROM0/DTFAG_ROM0_B5.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B6("./ROM0/DTFAG_ROM0_B6.txt");
    std::ofstream Bin_DTFAG_DIF_ROM0_B7("./ROM0/DTFAG_ROM0_B7.txt");
    // ROM1
    std::ofstream Bin_DTFAG_DIF_ROM1_B0("./ROM1/DTFAG_ROM1_B0.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B1("./ROM1/DTFAG_ROM1_B1.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B2("./ROM1/DTFAG_ROM1_B2.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B3("./ROM1/DTFAG_ROM1_B3.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B4("./ROM1/DTFAG_ROM1_B4.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B5("./ROM1/DTFAG_ROM1_B5.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B6("./ROM1/DTFAG_ROM1_B6.txt");
    std::ofstream Bin_DTFAG_DIF_ROM1_B7("./ROM1/DTFAG_ROM1_B7.txt");
    // ROM2
    std::ofstream Bin_DTFAG_DIF_ROM2_B0("./ROM2/DTFAG_ROM2_B0.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B1("./ROM2/DTFAG_ROM2_B1.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B2("./ROM2/DTFAG_ROM2_B2.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B3("./ROM2/DTFAG_ROM2_B3.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B4("./ROM2/DTFAG_ROM2_B4.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B5("./ROM2/DTFAG_ROM2_B5.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B6("./ROM2/DTFAG_ROM2_B6.txt");
    std::ofstream Bin_DTFAG_DIF_ROM2_B7("./ROM2/DTFAG_ROM2_B7.txt");
    //-----------------------------------------
    //--------------ZZ to hex-------------------
    std::ofstream hex_DTFAG_DIF_ROM0("./ROM0/hex_DTFAG_ROM0.txt");
    std::ofstream hex_DTFAG_DIF_ROM1("./ROM1/hex_DTFAG_ROM1.txt");
    std::ofstream hex_DTFAG_DIF_ROM2("./ROM2/hex_DTFAG_ROM2.txt");

    //------------------------------------------

    int Tw2_display = 0;
    int Tw1_display = 0;
    int Tw0_display = false;
    int Tw_th = 1;
    int debug = 1;

    vector<vector<ZZ > > ROM0;
    vector<vector<ZZ > > ROM1, ROM2;
    ROM0.resize(radix_r1);
    for(int i=0; i<radix_r1; i++){
        ROM0[i].resize(radix_r1);
    }
    ROM1.resize(arr_size);
    for(int i=0; i<radix_r1; i++){
        ROM1[i].resize(radix_r1);
    }
    ROM2.resize(arr_size);
    for(int i=0; i<radix_r1; i++){
        ROM2[i].resize(radix_r1);
    }


    DTFAG_DIF_MixedRadix << "****************initial ROM********************" << endl;
    for(int k=0; k<radix_r1; k++){
        DTFAG_DIF_MixedRadix << "ROM0[" << "k=" << k <<  "] = [";
        for(int n=0; n<radix_r1; n++){
            ROM0[k][n] = (radix_r1 * radix_r2) * k * n;
            ZZ ROM0_dg; 
            ROM0_dg = (radix_r1 * radix_r2) * k * n;
            if(!debug) PowerMod(ROM0[k][n], fft_twiddle, ROM0_dg, fft_prime);
            DTFAG_DIF_MixedRadix << ROM0[k][n] << ", ";
        }
        DTFAG_DIF_MixedRadix << "]\n";
    }
    DTFAG_DIF_MixedRadix << "----------------------------------" << endl;
    for(int k=0; k<radix_r2; k++){
        DTFAG_DIF_MixedRadix << "ROM1[" << "k=" << k <<  "] = [";
        for(int n=0; n<radix_r1; n++){
            ROM1[k][n] = (radix_r1) * k * n;
            ZZ ROM1_dg; 
            ROM1_dg = (radix_r1) * k * n;
            if(!debug) PowerMod(ROM1[k][n], fft_twiddle, ROM1_dg, fft_prime);
            DTFAG_DIF_MixedRadix << ROM1[k][n] << ", ";
        }
        DTFAG_DIF_MixedRadix << "]\n";
    }
    DTFAG_DIF_MixedRadix << "----------------------------------" << endl;
    for(int k=0; k<radix_r1; k++){
        DTFAG_DIF_MixedRadix << "ROM2[" << "k=" << k <<  "] = [";
        for(int n=0; n<radix_r1; n++){
            ROM2[k][n] = k * n;
            ZZ ROM2_dg; 
            ROM2_dg = k * n;
            if(!debug) PowerMod(ROM2[k][n], fft_twiddle, ROM2_dg, fft_prime);
            DTFAG_DIF_MixedRadix << ROM2[k][n] << ", ";
        }
        DTFAG_DIF_MixedRadix << "]\n";
    }

    //------------------------ZZ to Hex-------------------------
    for (int n = 0; n < 16; n++){
        for (int k = 0; k < 16; k++){
            hex_DTFAG_DIF_ROM0 << "ROM0_arr[" << k << "][" << n << "] <= 64'd" << ROM0[k][n] << ";\n";
        }
    }
    for (int n = 0; n < 16; n++){
        for (int k = 0; k < 16; k++){
            hex_DTFAG_DIF_ROM1 << "ROM1_arr[" << k << "][" << n << "] <= 64'd" << ROM1[k][n] << ";\n";
        }
    }
    for (int n = 0; n < 16; n++){
        for (int k = 0; k < 16; k++){
            hex_DTFAG_DIF_ROM2 << "ROM2_arr[" << k << "][" << n << "] <= 64'd" << ROM2[k][n] << ";\n";
        }
    }
    // -----------------------ZZ To Bin-------------------------
    int ROM_upper_bound = 64;
    // ROM0
    for(int k=0; k<ROM_upper_bound; k++){
        vector<ZZ > ROM0_D1;
        vector<ZZ > ROM0_D2;
        vector<ZZ > ROM0_D3;
        vector<ZZ > ROM0_D4;
        vector<ZZ > ROM0_D5;
        vector<ZZ > ROM0_D6;
        vector<ZZ > ROM0_D7;
        vector<ZZ > ROM0_D8;
        vector<ZZ > ROM0_D9;
        vector<ZZ > ROM0_D10;
        vector<ZZ > ROM0_D11;
        vector<ZZ > ROM0_D12;
        vector<ZZ > ROM0_D13;
        vector<ZZ > ROM0_D14;
        vector<ZZ > ROM0_D15;
        int bit_width = 64;
        ROM0_D1.resize(bit_width);
        ROM0_D2.resize(bit_width);
        ROM0_D3.resize(bit_width);
        ROM0_D4.resize(bit_width);
        ROM0_D5.resize(bit_width);
        ROM0_D6.resize(bit_width);
        ROM0_D7.resize(bit_width);
        ROM0_D8.resize(bit_width);
        ROM0_D9.resize(bit_width);
        ROM0_D10.resize(bit_width);
        ROM0_D11.resize(bit_width);
        ROM0_D12.resize(bit_width);
        ROM0_D13.resize(bit_width);
        ROM0_D14.resize(bit_width);
        ROM0_D15.resize(bit_width);
        if (k >= radix_r1){
            for (int i = 0; i < ROM_upper_bound; i++){
                ROM0_D1[i] = 0;
                ROM0_D2[i] = 0;
                ROM0_D3[i] = 0;
                ROM0_D4[i] = 0;
                ROM0_D5[i] = 0;
                ROM0_D6[i] = 0;
                ROM0_D7[i] = 0;
                ROM0_D8[i] = 0;
                ROM0_D9[i] = 0;
                ROM0_D10[i] = 0;
                ROM0_D11[i] = 0;
                ROM0_D12[i] = 0;
                ROM0_D13[i] = 0;
                ROM0_D14[i] = 0;
                ROM0_D15[i] = 0;
            }
        }else{
            ROM0_D1 = DecToBin.ZZ_DecToBin(ROM0[k][1], bit_width);
            ROM0_D2 = DecToBin.ZZ_DecToBin(ROM0[k][2], bit_width);
            ROM0_D3 = DecToBin.ZZ_DecToBin(ROM0[k][3], bit_width);
            ROM0_D4 = DecToBin.ZZ_DecToBin(ROM0[k][4], bit_width);
            ROM0_D5 = DecToBin.ZZ_DecToBin(ROM0[k][5], bit_width);
            ROM0_D6 = DecToBin.ZZ_DecToBin(ROM0[k][6], bit_width);
            ROM0_D7 = DecToBin.ZZ_DecToBin(ROM0[k][7], bit_width);
            ROM0_D8 = DecToBin.ZZ_DecToBin(ROM0[k][8], bit_width);
            ROM0_D9 = DecToBin.ZZ_DecToBin(ROM0[k][9], bit_width);
            ROM0_D10 = DecToBin.ZZ_DecToBin(ROM0[k][10], bit_width);
            ROM0_D11 = DecToBin.ZZ_DecToBin(ROM0[k][11], bit_width);
            ROM0_D12 = DecToBin.ZZ_DecToBin(ROM0[k][12], bit_width);
            ROM0_D13 = DecToBin.ZZ_DecToBin(ROM0[k][13], bit_width);
            ROM0_D14 = DecToBin.ZZ_DecToBin(ROM0[k][14], bit_width);
            ROM0_D15 = DecToBin.ZZ_DecToBin(ROM0[k][15], bit_width);
        }     
        
        for (int i = 0; i < bit_width; i++){
            // 64 bits
            Bin_DTFAG_DIF_ROM0_B0 << ROM0_D1[bit_width-1-i];
            // 128 bits
            Bin_DTFAG_DIF_ROM0_B1 << ROM0_D2[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B2 << ROM0_D4[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B3 << ROM0_D6[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B4 << ROM0_D8[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B5 << ROM0_D10[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B6 << ROM0_D12[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B7 << ROM0_D14[bit_width-1-i];
        }
        //Bin_DTFAG_DIF_ROM0_B1 << "_";
        //Bin_DTFAG_DIF_ROM0_B2 << "_";
        //Bin_DTFAG_DIF_ROM0_B3 << "_";
        //Bin_DTFAG_DIF_ROM0_B4 << "_";
        //Bin_DTFAG_DIF_ROM0_B5 << "_";
        //Bin_DTFAG_DIF_ROM0_B6 << "_";
        //Bin_DTFAG_DIF_ROM0_B7 << "_";
        for (int i = 0; i < bit_width; i++){
            // 128 bits
            Bin_DTFAG_DIF_ROM0_B1 << ROM0_D3[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B2 << ROM0_D5[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B3 << ROM0_D7[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B4 << ROM0_D9[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B5 << ROM0_D11[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B6 << ROM0_D13[bit_width-1-i];
            Bin_DTFAG_DIF_ROM0_B7 << ROM0_D15[bit_width-1-i];
        }
        Bin_DTFAG_DIF_ROM0_B0 << endl;
        Bin_DTFAG_DIF_ROM0_B1 << endl;
        Bin_DTFAG_DIF_ROM0_B2 << endl;
        Bin_DTFAG_DIF_ROM0_B3 << endl;
        Bin_DTFAG_DIF_ROM0_B4 << endl;
        Bin_DTFAG_DIF_ROM0_B5 << endl;
        Bin_DTFAG_DIF_ROM0_B6 << endl;
        Bin_DTFAG_DIF_ROM0_B7 << endl;
    }
    
    // ROM1
    for(int k=0; k<ROM_upper_bound; k++){
        vector<ZZ > ROM1_D1;
        vector<ZZ > ROM1_D2;
        vector<ZZ > ROM1_D3;
        vector<ZZ > ROM1_D4;
        vector<ZZ > ROM1_D5;
        vector<ZZ > ROM1_D6;
        vector<ZZ > ROM1_D7;
        vector<ZZ > ROM1_D8;
        vector<ZZ > ROM1_D9;
        vector<ZZ > ROM1_D10;
        vector<ZZ > ROM1_D11;
        vector<ZZ > ROM1_D12;
        vector<ZZ > ROM1_D13;
        vector<ZZ > ROM1_D14;
        vector<ZZ > ROM1_D15;
        int bit_width = 64;
        ROM1_D1.resize(bit_width);
        ROM1_D2.resize(bit_width);
        ROM1_D3.resize(bit_width);
        ROM1_D4.resize(bit_width);
        ROM1_D5.resize(bit_width);
        ROM1_D6.resize(bit_width);
        ROM1_D7.resize(bit_width);
        ROM1_D8.resize(bit_width);
        ROM1_D9.resize(bit_width);
        ROM1_D10.resize(bit_width);
        ROM1_D11.resize(bit_width);
        ROM1_D12.resize(bit_width);
        ROM1_D13.resize(bit_width);
        ROM1_D14.resize(bit_width);
        ROM1_D15.resize(bit_width);
        if (k >= radix_r1){
            for (int i = 0; i < ROM_upper_bound; i++){
                ROM1_D1[i] = 0;
                ROM1_D2[i] = 0;
                ROM1_D3[i] = 0;
                ROM1_D4[i] = 0;
                ROM1_D5[i] = 0;
                ROM1_D6[i] = 0;
                ROM1_D7[i] = 0;
                ROM1_D8[i] = 0;
                ROM1_D9[i] = 0;
                ROM1_D10[i] = 0;
                ROM1_D11[i] = 0;
                ROM1_D12[i] = 0;
                ROM1_D13[i] = 0;
                ROM1_D14[i] = 0;
                ROM1_D15[i] = 0;
            }
        }else{
            ROM1_D1 = DecToBin.ZZ_DecToBin(ROM1[k][1], bit_width);
            ROM1_D2 = DecToBin.ZZ_DecToBin(ROM1[k][2], bit_width);
            ROM1_D3 = DecToBin.ZZ_DecToBin(ROM1[k][3], bit_width);
            ROM1_D4 = DecToBin.ZZ_DecToBin(ROM1[k][4], bit_width);
            ROM1_D5 = DecToBin.ZZ_DecToBin(ROM1[k][5], bit_width);
            ROM1_D6 = DecToBin.ZZ_DecToBin(ROM1[k][6], bit_width);
            ROM1_D7 = DecToBin.ZZ_DecToBin(ROM1[k][7], bit_width);
            ROM1_D8 = DecToBin.ZZ_DecToBin(ROM1[k][8], bit_width);
            ROM1_D9 = DecToBin.ZZ_DecToBin(ROM1[k][9], bit_width);
            ROM1_D10 = DecToBin.ZZ_DecToBin(ROM1[k][10], bit_width);
            ROM1_D11 = DecToBin.ZZ_DecToBin(ROM1[k][11], bit_width);
            ROM1_D12 = DecToBin.ZZ_DecToBin(ROM1[k][12], bit_width);
            ROM1_D13 = DecToBin.ZZ_DecToBin(ROM1[k][13], bit_width);
            ROM1_D14 = DecToBin.ZZ_DecToBin(ROM1[k][14], bit_width);
            ROM1_D15 = DecToBin.ZZ_DecToBin(ROM1[k][15], bit_width);
        }    
        for (int i = 0; i < bit_width; i++){
            // 64 bits
            Bin_DTFAG_DIF_ROM1_B0 << ROM1_D1[bit_width-1-i];
            // 128 bits
            Bin_DTFAG_DIF_ROM1_B1 << ROM1_D2[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B2 << ROM1_D4[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B3 << ROM1_D6[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B4 << ROM1_D8[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B5 << ROM1_D10[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B6 << ROM1_D12[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B7 << ROM1_D14[bit_width-1-i];
        }
        //Bin_DTFAG_DIF_ROM1_B1 << "_";
        //Bin_DTFAG_DIF_ROM1_B2 << "_";
        //Bin_DTFAG_DIF_ROM1_B3 << "_";
        //Bin_DTFAG_DIF_ROM1_B4 << "_";
        //Bin_DTFAG_DIF_ROM1_B5 << "_";
        //Bin_DTFAG_DIF_ROM1_B6 << "_";
        //Bin_DTFAG_DIF_ROM1_B7 << "_";
        for (int i = 0; i < bit_width; i++){
            // 128 bits
            Bin_DTFAG_DIF_ROM1_B1 << ROM1_D3[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B2 << ROM1_D5[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B3 << ROM1_D7[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B4 << ROM1_D9[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B5 << ROM1_D11[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B6 << ROM1_D13[bit_width-1-i];
            Bin_DTFAG_DIF_ROM1_B7 << ROM1_D15[bit_width-1-i];
        }
        Bin_DTFAG_DIF_ROM1_B0 << endl;
        Bin_DTFAG_DIF_ROM1_B1 << endl;
        Bin_DTFAG_DIF_ROM1_B2 << endl;
        Bin_DTFAG_DIF_ROM1_B3 << endl;
        Bin_DTFAG_DIF_ROM1_B4 << endl;
        Bin_DTFAG_DIF_ROM1_B5 << endl;
        Bin_DTFAG_DIF_ROM1_B6 << endl;
        Bin_DTFAG_DIF_ROM1_B7 << endl;
    }
    // ROM2
    for(int k=0; k<ROM_upper_bound; k++){
        vector<ZZ > ROM2_D1;
        vector<ZZ > ROM2_D2;
        vector<ZZ > ROM2_D3;
        vector<ZZ > ROM2_D4;
        vector<ZZ > ROM2_D5;
        vector<ZZ > ROM2_D6;
        vector<ZZ > ROM2_D7;
        vector<ZZ > ROM2_D8;
        vector<ZZ > ROM2_D9;
        vector<ZZ > ROM2_D10;
        vector<ZZ > ROM2_D11;
        vector<ZZ > ROM2_D12;
        vector<ZZ > ROM2_D13;
        vector<ZZ > ROM2_D14;
        vector<ZZ > ROM2_D15;
        int bit_width = 64;
        ROM2_D1.resize(bit_width);
        ROM2_D2.resize(bit_width);
        ROM2_D3.resize(bit_width);
        ROM2_D4.resize(bit_width);
        ROM2_D5.resize(bit_width);
        ROM2_D6.resize(bit_width);
        ROM2_D7.resize(bit_width);
        ROM2_D8.resize(bit_width);
        ROM2_D9.resize(bit_width);
        ROM2_D10.resize(bit_width);
        ROM2_D11.resize(bit_width);
        ROM2_D12.resize(bit_width);
        ROM2_D13.resize(bit_width);
        ROM2_D14.resize(bit_width);
        ROM2_D15.resize(bit_width);
        if (k >= radix_r1){
            for (int i = 0; i < ROM_upper_bound; i++){
                ROM2_D1[i] = 0;
                ROM2_D2[i] = 0;
                ROM2_D3[i] = 0;
                ROM2_D4[i] = 0;
                ROM2_D5[i] = 0;
                ROM2_D6[i] = 0;
                ROM2_D7[i] = 0;
                ROM2_D8[i] = 0;
                ROM2_D9[i] = 0;
                ROM2_D10[i] = 0;
                ROM2_D11[i] = 0;
                ROM2_D12[i] = 0;
                ROM2_D13[i] = 0;
                ROM2_D14[i] = 0;
                ROM2_D15[i] = 0;
            }
        }else{
            ROM2_D1 = DecToBin.ZZ_DecToBin(ROM2[k][1], bit_width);
            ROM2_D2 = DecToBin.ZZ_DecToBin(ROM2[k][2], bit_width);
            ROM2_D3 = DecToBin.ZZ_DecToBin(ROM2[k][3], bit_width);
            ROM2_D4 = DecToBin.ZZ_DecToBin(ROM2[k][4], bit_width);
            ROM2_D5 = DecToBin.ZZ_DecToBin(ROM2[k][5], bit_width);
            ROM2_D6 = DecToBin.ZZ_DecToBin(ROM2[k][6], bit_width);
            ROM2_D7 = DecToBin.ZZ_DecToBin(ROM2[k][7], bit_width);
            ROM2_D8 = DecToBin.ZZ_DecToBin(ROM2[k][8], bit_width);
            ROM2_D9 = DecToBin.ZZ_DecToBin(ROM2[k][9], bit_width);
            ROM2_D10 = DecToBin.ZZ_DecToBin(ROM2[k][10], bit_width);
            ROM2_D11 = DecToBin.ZZ_DecToBin(ROM2[k][11], bit_width);
            ROM2_D12 = DecToBin.ZZ_DecToBin(ROM2[k][12], bit_width);
            ROM2_D13 = DecToBin.ZZ_DecToBin(ROM2[k][13], bit_width);
            ROM2_D14 = DecToBin.ZZ_DecToBin(ROM2[k][14], bit_width);
            ROM2_D15 = DecToBin.ZZ_DecToBin(ROM2[k][15], bit_width);
        }
               
        for (int i = 0; i < bit_width; i++){
            // 64 bits
            Bin_DTFAG_DIF_ROM2_B0 << ROM2_D1[bit_width-1-i];
            // 128 bits
            Bin_DTFAG_DIF_ROM2_B1 << ROM2_D2[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B2 << ROM2_D4[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B3 << ROM2_D6[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B4 << ROM2_D8[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B5 << ROM2_D10[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B6 << ROM2_D12[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B7 << ROM2_D14[bit_width-1-i];
        }
        //Bin_DTFAG_DIF_ROM2_B1 << "_";
        //Bin_DTFAG_DIF_ROM2_B2 << "_";
        //Bin_DTFAG_DIF_ROM2_B3 << "_";
        //Bin_DTFAG_DIF_ROM2_B4 << "_";
        //Bin_DTFAG_DIF_ROM2_B5 << "_";
        //Bin_DTFAG_DIF_ROM2_B6 << "_";
        //Bin_DTFAG_DIF_ROM2_B7 << "_";
        for (int i = 0; i < bit_width; i++){
            // 128 bits
            Bin_DTFAG_DIF_ROM2_B1 << ROM2_D3[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B2 << ROM2_D5[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B3 << ROM2_D7[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B4 << ROM2_D9[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B5 << ROM2_D11[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B6 << ROM2_D13[bit_width-1-i];
            Bin_DTFAG_DIF_ROM2_B7 << ROM2_D15[bit_width-1-i];
        }
        Bin_DTFAG_DIF_ROM2_B0 << endl;
        Bin_DTFAG_DIF_ROM2_B1 << endl;
        Bin_DTFAG_DIF_ROM2_B2 << endl;
        Bin_DTFAG_DIF_ROM2_B3 << endl;
        Bin_DTFAG_DIF_ROM2_B4 << endl;
        Bin_DTFAG_DIF_ROM2_B5 << endl;
        Bin_DTFAG_DIF_ROM2_B6 << endl;
        Bin_DTFAG_DIF_ROM2_B7 << endl;
    }
    //------------------------------------------------------------




    DTFAG_DIF_MixedRadix << "**************intital fin****************" << endl;

    for(int i=0; i<radix_r2; i++){
        DTFAG_DIF_MixedRadix << "  i = " << i << endl;
        for(int t=0; t<radix_r1; t++){
            DTFAG_DIF_MixedRadix << "  t = " << t << endl;
            for(int j=0; j<radix_r1; j++){
                DTFAG_DIF_MixedRadix << "----------------------------" << endl;
                if(Tw2_display || Tw1_display || Tw0_display){
                    if(j == Tw_th) DTFAG_DIF_MixedRadix << "       j = " << j << endl;
                }else{
                    DTFAG_DIF_MixedRadix << "      j = " << j << " (TF" << j << ")"<< endl;
                }
                
                MA0 = j;
                DTFAG_DIF_MixedRadix << "      MA0 = " << MA0 << endl;
                MA1 = NTTSPMB.Gray(i,radix_r1);
                DTFAG_DIF_MixedRadix << "      MA1 = " << MA1 << endl;
                if(i % 2 == 1){
                    int t_complement = number_complement.number_complement(t, radix_r1);
                    MA2 = NTTSPMB.Gray(t_complement,radix_r1);
                    DTFAG_DIF_MixedRadix << "      MA2 : " << MA2 << " = " << "G(" << t_complement << ")"<< endl; 
                }else{
                    MA2 = NTTSPMB.Gray(t,radix_r1);
                    DTFAG_DIF_MixedRadix << "      MA2 : " << MA2 << " = " << "G(" << t << ")"<< endl; 
                }        
                if(radix_r1 == radix_r2) {
                    MA_MixedRadix = j;
                    DTFAG_DIF_MixedRadix << "      MA_MixedRadix = " << MA_MixedRadix << endl;
                }else {
                    MA_MixedRadix =  (j * (radix_r1/radix_r2)) % radix_r1;
                    DTFAG_DIF_MixedRadix << "      MA_MixedRadix = " << MA_MixedRadix << endl;
                }
                
                for(int i=0; i<radix_r1; i++){
                    v0[i] = ROM0[MA0][i];
                }
                for(int i=0; i<radix_r1; i++){
                    v1[i] = ROM1[MA1][i];
                }
                for(int i=0; i<radix_r1; i++){
                    v2[i] = ROM2[MA2][i];
                }
                for(int i=0; i<radix_r1; i++){
                    v_MixedRadix[i] = ROM0[MA_MixedRadix][i];
                }
                
                //----------TW compute-----------
                for(int i=0; i<radix_r1; i++){
                    if(Tw0_display){
                        if(j == Tw_th){
                            //-----------for debug-------------------
                            if(debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i] << ", v2[" << i << "] = " << v2[i];
                            if(debug) Tw0[i] = v0[i] + v1[i] + v2[i];
                            if(debug) DTFAG_DIF_MixedRadix << ", Tw0[" << i << "] = " << Tw0[i] << endl;
                            //----------------------------------------

                            //--------real compute------------
                            ZZ tmp;
                            if(!debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i] << ", v2[" << i << "] = " << v2[i];
                            if(!debug) MulMod(tmp, v1[i], v2[i], fft_prime);
                            if(!debug) MulMod(Tw0[i], v0[i], tmp, fft_prime);
                            if(!debug) DTFAG_DIF_MixedRadix << ", Tw0[" << i << "] = " << Tw0[i] << endl;
                            //---------------------------------
                        }
                    }else {
                        //-----------for debug-------------------
                        if(debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i] << ", v2[" << i << "] = " << v2[i];
                        if(debug) Tw0[i] = v0[i] + v1[i] + v2[i];
                        if(debug) DTFAG_DIF_MixedRadix << ", Tw0[" << i << "] = " << Tw0[i] << endl;
                        //----------------------------------------

                        //--------real compute------------
                        ZZ tmp;
                        if(!debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i] << ", v2[" << i << "] = " << v2[i];
                        if(!debug) MulMod(tmp, v1[i], v2[i], fft_prime);
                        if(!debug) MulMod(Tw0[i], v0[i], tmp, fft_prime);
                        if(!debug) DTFAG_DIF_MixedRadix << ", Tw0[" << i << "] = " << Tw0[i] << endl;
                        //---------------------------------
                    }
                    
                }
                  
                for(int i=0; i<radix_r1; i++){
                   if(Tw1_display){
                       if(j == Tw_th){
                            //-----------for debug-------------------
                            if(debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i];
                            if(debug) Tw1[i] = v0[i] + v1[i];
                            if(debug) DTFAG_DIF_MixedRadix << ", Tw1[" << i << "] = " << Tw1[i] << endl;
                            //----------------------------------------

                            //--------real compute------------
                            if(!debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i];
                            if(!debug) MulMod(Tw1[i], v1[i], v0[i], fft_prime);
                            if(!debug) DTFAG_DIF_MixedRadix << ", Tw1[" << i << "] = " << Tw1[i] << endl;
                            //---------------------------------
                       }
                   }else {
                        //-----------for debug-------------------
                        if(debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i];
                        if(debug) Tw1[i] = v0[i] + v1[i];
                        if(debug) DTFAG_DIF_MixedRadix << ", Tw1[" << i << "] = " << Tw1[i] << endl;
                        //----------------------------------------

                        //--------real compute------------
                        if(!debug) DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i] << ", v1[" << i << "] = " << v1[i];
                        if(!debug) MulMod(Tw1[i], v1[i], v0[i], fft_prime);
                        if(!debug) DTFAG_DIF_MixedRadix << ", Tw1[" << i << "] = " << Tw1[i] << endl;
                        //---------------------------------
                   }
                   
                }  

                for(int i=0; i<radix_r1; i++){
                   if(Tw2_display){
                       if(j == Tw_th){
                            //--------real compute------------
                            if(radix_r1 == radix_r2){
                                DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i];
                                Tw2[i] = v0[i];
                                DTFAG_DIF_MixedRadix << ", Tw2[" << i << "] = " << Tw2[i] << endl;
                            }else{
                                DTFAG_DIF_MixedRadix << "v_MixedRadix[" << i << "] = " << v_MixedRadix[i];
                                Tw2[i] = v_MixedRadix[i];
                                DTFAG_DIF_MixedRadix << ", Tw2[" << i << "] = " << Tw2[i] << endl;
                            }
                            //---------------------------------
                       }
                   }else {
                        //--------real compute------------
                        if(radix_r1 == radix_r2){
                            DTFAG_DIF_MixedRadix << "v0[" << i << "] = " << v0[i];
                            Tw2[i] = v0[i];
                            DTFAG_DIF_MixedRadix << ", Tw2[" << i << "] = " << Tw2[i] << endl;
                        }else{
                            DTFAG_DIF_MixedRadix << "v_MixedRadix[" << i << "] = " << v_MixedRadix[i];
                            Tw2[i] = v_MixedRadix[i];
                            DTFAG_DIF_MixedRadix << ", Tw2[" << i << "] = " << Tw2[i] << endl;
                        }
                        //---------------------------------
                   }
                   
                } 
                
                //--------------------------------
            }
        }
    }
}