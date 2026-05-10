count = [2.30e7; 1.75e7; 8.00e6; 1.65e7; 1.43e7; 2.00e7];
ph = [2; 3; 4; 4; 7; 7];
tryp = [false; true; false; true; false; true];

tryp_cat = categorical(tryp, [false, true], {'No Trypsin,', 'Trypsin present'});
ph_cat = categorical(ph);

[p, tbl, stats] = anovan(count, {ph_cat, tryp_cat}, 'model','linear','varnames', {'ph', 'tryp'});

[m,gname] = grpstats(count, {ph_cat, tryp_cat}, {'mean', 'gname'});
disp('Group Means (pH, tryp):');
disp([gname, num2cell(m)]);