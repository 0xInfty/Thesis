#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 12:24:04 2020

@author: vall
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.pylab as plab
import os
import PyMieScatt as ps
import v_analysis as va
import v_materials as vm
import v_save as vs
import v_utilities as vu

#%% PARAMETERS

# Saving directories
folder = ["AuMieMediums/AllWaterMaxRes/AllWaterMax103Res"]
home = vs.get_home()

# Sorting and labelling data series
sorting_function = [lambda l : vu.sort_by_number(l, -1)]
# def special_label(s):
#     if "5" in s:
#         return "Mie"
#     else:
#         return ""
series_label = [lambda s : f"Meep Resolution {vu.find_numbers(s)[-1]}"]
series_must = [""] # leave "" per default
series_column = [1]

# Scattering plot options
plot_title = "Scattering for Au spheres in water with 103 nm diameter"
series_colors = [plab.cm.Blues]
series_linestyles = ["solid"]
plot_make_big = True
plot_file = lambda n : os.path.join(home, "DataAnalysis/AllWaterMax103FU20Res" + n)

#%% LOAD DATA

path = []
file = []
series = []
data = []
params = []
header = []

for f, sf, sm in zip(folder, sorting_function, series_must):

    path.append( os.path.join(home, f) )
    file.append( lambda f, s : os.path.join(path[-1], f, s) )
    
    series.append( os.listdir(path[-1]) )
    series[-1] = vu.filter_by_string_must(series[-1], sm)
    series[-1] = sf(series[-1])
    
    data.append( [] )
    params.append( [] )
    for s in series[-1]:
        data[-1].append(np.loadtxt(file[-1](s, "Results.txt")))
        params[-1].append(vs.retrieve_footer(file[-1](s, "Results.txt")))
    header.append( vs.retrieve_header(file[-1](s, "Results.txt")) )
    
    for i in range(len(params[-1])):
        if not isinstance(params[-1][i], dict): 
            params[-1][i] = vu.fix_params_dict(params[-1][i])
    
    # r = [p["r"] for p in params]
    # from_um_factor = [p["from_um_factor"] for p in params]

#%% LOAD MIE DATA

from_um_factor = params[0][0]["from_um_factor"]
wlen_range = params[0][0]["wlen_range"]
r = params[0][0]["r"]
index = params[0][0]["submerged_index"]

medium = vm.import_medium("Au", from_um_factor)

wlens = data[0][0][:,0]
freqs = 1e3*from_um_factor/wlens
scatt_eff_theory = [ps.MieQ(np.sqrt(medium.epsilon(f)[0,0]*medium.mu(f)[0,0]), 
                            1e3*from_um_factor/f,
                            2*r*1e3*from_um_factor,
                            nMedium=index,
                            asDict=True)['Qsca'] 
                    for f in freqs]

#%% GET MAX WAVELENGTH

max_wlen = []
for d, sc in zip(data, series_column):
    max_wlen.append( [d[i][np.argmax(d[i][:,sc]), 0] for i in range(len(d))] )
max_wlen_theory = wlens[np.argmax(scatt_eff_theory)]

dif_max_wlen = [ml - max_wlen_theory for ml in max_wlen[0]]

resolution = [vu.find_numbers(s)[-1] for s in series[0]]

def exponential_fit(X, A, b, C):
    return A * np.exp(-b*X) + C

# First value is wrong
resolution = resolution[1:]
dif_max_wlen = dif_max_wlen[1:]

rsq, parameters = va.nonlinear_fit(np.array(resolution), 
                                   np.array(dif_max_wlen), 
                                   exponential_fit)

plt.title("Difference in scattering maximum's wavelength for Au 103 nm sphere")
plt.legend(["Data", "Fit"])
plt.xlabel("Resolution")
plt.ylabel("Difference in wavelength $\lambda_{max}^{MEEP}-\lambda_{max}^{MIE}$")
vs.saveplot(plot_file("WLenDiff.png"), overwrite=True)

#%% GET ENLAPSED TIME

enlapsed_time = [params[0][i]["enlapsed"] for i in range(len(data[0]))]
total_enlapsed_time = [sum(et) for et in enlapsed_time]

#%% PLOT NORMALIZED

colors = [sc(np.linspace(0,1,len(s)+3))[3:] 
          for sc, s in zip(series_colors, series)]

plt.figure()
plt.title(plot_title)
for s, d, p, sc, psl, pc, pls in zip(series, data, params, series_column, 
                                     series_label, colors, series_linestyles):

    for ss, sd, sp, spc in zip(s, d, p, pc):
        if ss!=series[0][0]:
            plt.plot(sd[:,0], sd[:,sc] / max(sd[:,sc]), 
                     linestyle=pls, color=spc, label=psl(ss))

plt.plot(wlens, scatt_eff_theory / max(scatt_eff_theory), 
         linestyle="dashed", color='red', label="Mie Theory")
plt.xlabel("Wavelength [nm]")
plt.ylabel("Normalized Scattering Cross Section")
plt.legend()
if plot_make_big:
    mng = plt.get_current_fig_manager()
    mng.window.showMaximized()
del mng
vs.saveplot(plot_file("AllScatt.png"), overwrite=True)

#%% PLOT EFFIENCIENCY

colors = [sc(np.linspace(0,1,len(s)+3))[3:] 
          for sc, s in zip(series_colors, series)]

plt.figure()
plt.title(plot_title)
for s, d, p, sc, psl, pc, pls in zip(series, data, params, series_column, 
                                     series_label, colors, series_linestyles):

    for ss, sd, sp, spc in zip(s, d, p, pc):
        if ss!=series[0][0]:
            plt.plot(sd[:,0], sd[:,sc],# / max(sd[:,sc]), 
                     linestyle=pls, color=spc, label=psl(ss))

plt.plot(wlens, scatt_eff_theory,# / max(scatt_eff_theory), 
         linestyle="dashed", color='red', label="Mie Theory")
plt.xlabel("Wavelength [nm]")
plt.ylabel("Scattering Effiency")
plt.legend()
if plot_make_big:
    mng = plt.get_current_fig_manager()
    mng.window.showMaximized()
del mng
vs.saveplot(plot_file("AllScattEff.png"), overwrite=True)