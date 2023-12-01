#     makefile for MOOGSILENT with all of the common block assignments;
#     this is for a 64-bit linux machine

#     here are the object files
OBJECTS = Abfind.o Abpop.o Abunplot.o Batom.o Begin.o Binary.o \
	Binplot.o Binplotprep.o Blankstring.o Blends.o Bmolec.o Boxit.o \
	Calmod.o Cdcalc.o Chabund.o Cog.o Cogplot.o Cogsyn.o \
	Correl.o Crosscorr.o Curve.o Damping.o Defcolor.o Discov.o \
	Doflux.o Drawcurs.o Eqlib.o Estim.o Ewfind.o \
	Ewweighted.o Fakeline.o Findtic.o Finish.o \
	Fluxplot.o Gammabark.o Getasci.o Getcount.o Getnum.o Getsyns.o \
	Gridplo.o Gridsyn.o Infile.o Inlines.o Inmodel.o Invert.o \
	Jexpint.o Lineinfo.o Lineabund.o Linlimit.o \
	Makeplot.o Minimax.o Molquery.o Moogsilent.o Mydriver.o \
	Nansi.o Nearly.o Number.o Obshead.o \
	Oneline.o Opaccouls.o OpacHelium.o OpacHydrogen.o \
	Opacit.o Opacmetals.o Opacscat.o Params.o Partfn.o \
	Partnew.o Plotit.o Plotremember.o Pltabun.o Pltcog.o \
	Pltflux.o Pltspec.o Pointcurs.o Prinfo.o Putasci.o Readobs.o \
	Rinteg.o Smooth.o Specplot.o Stats.o Sunder.o Synpop.o Synspec.o \
	Synth.o Tablepop.o Taukap.o Total.o Trudamp.o Ucalc.o Vargauss.o \
	Vmacro.o Voigt.o Wavecalc.o Weedout.o Writenumber.o \
	Sourcefunc_scat_cont.o AngWeight.o \
	Sourcefunc_scat_line.o Cdcalc_JS.o



#     here are the common files
COMMON =  Atmos.com Dummy.com Equivs.com Factor.com Kappa.com Linex.com \
        Mol.com Multistar.com Obspars.com Plotval.com Pstuff.com \
        Quants.com Multimod.com Dampdat.com Source.com

FC = gfortran -m64 -Wall -O4 -ffixed-line-length-72 -ff2c -std=legacy


#        here are the compilation and linking commands
all: MOOGSILENT ;
	@echo -----------------------------------------------------------------
	@echo 
	@echo make sure that you have entered the proper parameters
	@echo for MOOGSILENT into the FORTRAN source driver 
	@echo routine Moogsilent.f !!!!!!!!!!!!
	@echo
	@echo NOTE: the isotop driver has been eliminated;
	@echo your synthesis needs for elemental and isotopic
	@echo abundances now can be handled with the synth driver
	@echo
	@echo -----------------------------------------------------------------

MOOGSILENT:  $(OBJECTS);
	$(FC) $(OBJECTS) -o MOOGSILENT

$(OBJECTS): $(COMMON)

clean:
	-rm -f *.o MOOGSILENT libMOOGSILENT.a
