A=readtable('BARC.xlsx');
% Make a datetime vector
Time = datetime(A{:,1},'InputFormat','yyyy.MM.dd');
Time.Hour = A{:,2};
% Add the datetime vector and remove the 1st&2nd columns
A.Time = Time;
A.Time(:,1:2) = [];
% Convert to timetable
TT = table2timetable(A);
% Apply retime function to obtain daily/monthly mean
TTdailyMean = retime(TT,'daily','mean');
TTmonthlyMean = retime(TT,'monthly','mean');
TTyearlyMean = retime(TT,'yearly','mean');