clear all

%find the average of the FLAT files
FLAT_n = 9;
sum_F = 0;
for k = 0:FLAT_n
    FLAT_Files = fitsread(sprintf('x.0000000%d.FLAT.FIT', k));
    sum_F = sum_F + FLAT_Files;
end
AvgFLAT = sum_F./(FLAT_n + 1);

%find the average of the BIAS files
BIAS_n = 19;
sum_B = 0;
for j = 10:BIAS_n
    BIAS_Files = fitsread(sprintf('x.000000%d.BIAS.FIT', j));
    sum_B = sum_B + BIAS_Files;
end
AvgBIAS = sum_B./(BIAS_n - FLAT_n);

%export average FITS and BIAS values to a .fit file to look at the pretty
%pictures in DS9
fitswrite(AvgFLAT, 'AvgFLAT.fit');
fitsdisp('AvgFLAT.fit');
fitswrite(AvgBIAS, 'AvgBIAS.fit');
fitsdisp('AvgBIAS.fit');

%import signal files
SGNL_start = 20;
SGNL_end = 99;
SGNL = cell(1, 999);
for l = SGNL_start:SGNL_end
    SGNL_Files = fitsread(sprintf('x.000000%d.FIT', l));
    SGNL{l} = SGNL_Files;
end
SGNL_start = 100;
SGNL_end = 215;
for l = SGNL_start:SGNL_end
    SGNL_Files = fitsread(sprintf('x.00000%d.FIT', l));
    SGNL{l} = SGNL_Files;
end
SGNL_start = 217;
SGNL_end = 220;
for l = SGNL_start:SGNL_end
    SGNL_Files = fitsread(sprintf('x.00000%d.FIT', l));
    SGNL{l} = SGNL_Files;
end
SGNL_start = 222;
SGNL_end = 999;
for l = SGNL_start:SGNL_end
    SGNL_Files = fitsread(sprintf('x.00000%d.FIT', l));
    SGNL{l} = SGNL_Files;
end

%corrected signals
CorrFLAT = AvgFLAT./AvgBIAS;
for m = 20:99
    CorrSGNL{m} = SGNL{m} - AvgBIAS;
end
for m = 100:215
    CorrSGNL{m} = SGNL{m} - AvgBIAS;
end
for m = 217:220
    CorrSGNL{m} = SGNL{m} - AvgBIAS;
end
for m = 222:999
    CorrSGNL{m} = SGNL{m} - AvgBIAS;
end

%Free up RAM
clear SGNL
disp('SGNL cleared senpai!')

%Relative signal at telescope
for m = 20:99
    RelSGNL{m} = CorrSGNL{m}./CorrFLAT;
end
for m = 100:215
    RelSGNL{m} = CorrSGNL{m}./CorrFLAT;
end
for m = 217:220
    RelSGNL{m} = CorrSGNL{m}./CorrFLAT;
end
for m = 222:999
    RelSGNL{m} = CorrSGNL{m}./CorrFLAT;
end

%Free up RAM
clear CorrSGNL
disp('Corr SGNL cleared senpai!')
clear SGNL_Files
clear sum_B
clear sum_F
clear FLAT_Files
clear CorrFLAT
disp('Files cleared!')

%Create a box around the star, and ignore all other data.
dx = 50;
dy = dx;
StarSGNL = cell(1,999);
for n = 20:38
    Py = 814;
    Px = 541;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 39:50
    Py = 816;
    Px = 536;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 51:88
    Py = 818;
    Px = 533;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 89:111
    Py = 822;
    Px = 530;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 112:138
    Py = 825;
    Px = 527;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 139:161
    Py = 816;
    Px = 523;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 162:188
    Py = 806;
    Px = 518;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 189:211
    Py = 785;
    Px = 512;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 212:215
    Py = 765;
    Px = 506;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 217:220
    Py = 765;
    Px = 506;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 222:238
    Py = 765;
    Px = 506;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 239:261
    Py = 744;
    Px = 501;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 262:288
    Py = 723;
    Px = 497;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 289:311
    Py = 700;
    Px = 490;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 312:338
    Py = 676;
    Px = 483;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 339:361
    Py = 648;
    Px = 475;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 362:388
    Py = 620;
    Px = 467;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 389:411
    Py = 602;
    Px = 461;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 412:438
    Py = 585;
    Px = 455;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 439:461
    Py = 558;
    Px = 447;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 462:488
    Py = 537;
    Px = 439;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 489:511
    Py = 525;
    Px = 432;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 512:538
    Py = 513;
    Px = 425;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 562:588
    Py = 483;
    Px = 408;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 612:638
    Py = 431;
    Px = 392;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 662:688
    Py = 376;
    Px = 372;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 712:738
    Py = 318;
    Px = 348;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 762:788
    Py = 511;
    Px = 438;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 812:838
    Py = 257;
    Px = 305;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 862:888
    Py = 217;
    Px = 276;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 912:999
    Py = 170;
    Px = 240;
    StarSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end

%Obtain the average intesity of the star (within the created box).
StarMean = zeros(1,999);
for n = 20:99
    StarMean(1,n) = mean(mean(StarSGNL{n}));
end
for n = 100:215
    StarMean(1,n) = mean(mean(StarSGNL{n}));
end
for n = 217:220
    StarMean(1,n) = mean(mean(StarSGNL{n}));
end
for n = 222:999
    StarMean(1,n) = mean(mean(StarSGNL{n}));
end

%Create a box around the check star, and ignore all other data.
ChkSGNL = cell(1,999);
for n = 20:38
    Py = 1009;
    Px = 632;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 51:88
    Py = 1014;
    Px = 625;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 112:138
    Py = 1020;
    Px = 619;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 162:188
    Py = 1002;
    Px = 608;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 212:215
    Py = 961;
    Px = 597;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 217:220
    Py = 961;
    Px = 597;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 222:238
    Py = 961;
    Px = 597;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 262:288
    Py = 919;
    Px = 588;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 312:338
    Py = 869;
    Px = 547;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 362:388
    Py = 815;
    Px = 558;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 412:438
    Py = 778;
    Px = 545;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 462:488
    Py = 732;
    Px = 530;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 512:538
    Py = 707;
    Px = 515;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 562:588
    Py = 677;
    Px = 501;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 612:638
    Py = 623;
    Px = 481;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 662:688
    Py = 567;
    Px = 461;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 712:738
    Py = 511;
    Px = 438;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 762:788
    Py = 474;
    Px = 417;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 812:838
    Py = 451;
    Px = 394;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 862:888
    Py = 408;
    Px = 365;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 912:999
    Py = 360;
    Px = 330;
    ChkSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end

%Obtain the average intesity of the check star (within the created box).
ChkMean = zeros(1,999);
for n = 20:99
    ChkMean(1,n) = Mean(Mean(ChkSGNL{n}));
end
for n = 100:215
    ChkMean(1,n) = Mean(Mean(ChkSGNL{n}));
end
for n = 217:220
    ChkMean(1,n) = Mean(Mean(ChkSGNL{n}));
end
for n = 222:999
    ChkMean(1,n) = Mean(Mean(ChkSGNL{n}));
end

%Create a box around space with no stars, and ignore all other data.
SpaceSGNL = cell(1,999);
for n = 20:38
    Py = 800;
    Px = 864;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 51:88
    Py = 788;
    Px = 857;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 112:138
    Py = 794;
    Px = 851;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 162:188
    Py = 775;
    Px = 841;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 212:215
    Py = 743;
    Px = 834;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 217:220
    Py = 743;
    Px = 834;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 222:238
    Py = 695;
    Px = 823;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 262:288
    Py = 656;
    Px = 813;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 312:338
    Py = 620;
    Px = 799;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 362:388
    Py = 581;
    Px = 785;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 412:438
    Py = 546;
    Px = 768;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 462:488
    Py = 495;
    Px = 751;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 512:538
    Py = 462;
    Px = 735;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 562:588
    Py = 427;
    Px = 721;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 612:638
    Py = 383;
    Px = 704;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 662:688
    Py = 335;
    Px = 683;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 712:738
    Py = 284;
    Px = 662;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 762:788
    Py = 237;
    Px = 637;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 812:838
    Py = 206;
    Px = 611;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 862:888
    Py = 158;
    Px = 577;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end
for n = 912:999
    Py = 158;
    Px = 577;
    SpaceSGNL{n} = RelSGNL{n}(Px - dx:Px + dx, Py - dy:Py + dy);
end

%Obtain the average intesity of space (within the created box).
SpaceMean = zeros(1,999);
for n = 20:99
    SpaceMean(1,n) = Mean(Mean(SpaceSGNL{n}));
end
for n = 100:215
    SpaceMean(1,n) = Mean(Mean(SpaceSGNL{n}));
end
for n = 217:220
    SpaceMean(1,n) = Mean(Mean(SpaceSGNL{n}));
end
for n = 222:999
    SpaceMean(1,n) = Mean(Mean(SpaceSGNL{n}));
end



Data = (StarMean - SpaceMean)./(ChkMean - SpaceMean);
Time = linspace(0, 0.5.*979, length(Data));
plot(Data,'.')
title('Lightcurve Plot for HD 187933b')
xlabel('Elapsed Time (hours)')
ylabel('Relative Intensity of Light from Star')

%Respect ma authoritah!
disp('Finished Senpai')
%CorrSGNL = cellfun(@minus, SGNL, AvgBIAS, 'UnelseiformOutput', true);
