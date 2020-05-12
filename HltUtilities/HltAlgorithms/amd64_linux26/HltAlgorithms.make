#-- start of make_header -----------------

#====================================
#  Library HltAlgorithms
#
#   Generated Tue May 12 11:17:13 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltAlgorithms_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltAlgorithms_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltAlgorithms

HltAlgorithms_tag = $(tag)

#cmt_local_tagfile_HltAlgorithms = $(HltAlgorithms_tag)_HltAlgorithms.make
cmt_local_tagfile_HltAlgorithms = $(bin)$(HltAlgorithms_tag)_HltAlgorithms.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltAlgorithms_tag = $(tag)

#cmt_local_tagfile_HltAlgorithms = $(HltAlgorithms_tag).make
cmt_local_tagfile_HltAlgorithms = $(bin)$(HltAlgorithms_tag).make

endif

include $(cmt_local_tagfile_HltAlgorithms)
#-include $(cmt_local_tagfile_HltAlgorithms)

ifdef cmt_HltAlgorithms_has_target_tag

cmt_final_setup_HltAlgorithms = $(bin)setup_HltAlgorithms.make
cmt_dependencies_in_HltAlgorithms = $(bin)dependencies_HltAlgorithms.in
#cmt_final_setup_HltAlgorithms = $(bin)HltAlgorithms_HltAlgorithmssetup.make
cmt_local_HltAlgorithms_makefile = $(bin)HltAlgorithms.make

else

cmt_final_setup_HltAlgorithms = $(bin)setup.make
cmt_dependencies_in_HltAlgorithms = $(bin)dependencies.in
#cmt_final_setup_HltAlgorithms = $(bin)HltAlgorithmssetup.make
cmt_local_HltAlgorithms_makefile = $(bin)HltAlgorithms.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltAlgorithmssetup.make

#HltAlgorithms :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltAlgorithms'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltAlgorithms/
#HltAlgorithms::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltAlgorithmslibname   = $(bin)$(library_prefix)HltAlgorithms$(library_suffix)
HltAlgorithmslib       = $(HltAlgorithmslibname).a
HltAlgorithmsstamp     = $(bin)HltAlgorithms.stamp
HltAlgorithmsshstamp   = $(bin)HltAlgorithms.shstamp

HltAlgorithms :: dirs  HltAlgorithmsLIB
	$(echo) "HltAlgorithms ok"

cmt_HltAlgorithms_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltAlgorithms_has_prototypes

HltAlgorithmsprototype :  ;

endif

HltAlgorithmscompile : $(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltAlgorithmsLIB :: $(HltAlgorithmslib) $(HltAlgorithmsshstamp)
	$(echo) "HltAlgorithms : library ok"

$(HltAlgorithmslib) :: $(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltAlgorithmslib) $(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o
	$(lib_silent) $(ranlib) $(HltAlgorithmslib)
	$(lib_silent) cat /dev/null >$(HltAlgorithmsstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(HltAlgorithmslibname).$(shlibsuffix) :: $(HltAlgorithmslib) requirements $(use_requirements) $(HltAlgorithmsstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltAlgorithms $(HltAlgorithms_shlibflags)
	$(lib_silent) cat /dev/null >$(HltAlgorithmsshstamp)

$(HltAlgorithmsshstamp) :: $(HltAlgorithmslibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltAlgorithmslibname).$(shlibsuffix) ; then cat /dev/null >$(HltAlgorithmsshstamp) ; fi

HltAlgorithmsclean ::
	$(cleanup_echo) objects HltAlgorithms
	$(cleanup_silent) /bin/rm -f $(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o) $(patsubst %.o,%.dep,$(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o) $(patsubst %.o,%.d.stamp,$(bin)EFSectorHits.o $(bin)EFDetectorHits.o $(bin)IEFAlgorithm.o $(bin)SimpleRec.o $(bin)MuonRec.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltAlgorithms_deps HltAlgorithms_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltAlgorithmsinstallname = $(library_prefix)HltAlgorithms$(library_suffix).$(shlibsuffix)

HltAlgorithms :: HltAlgorithmsinstall ;

install :: HltAlgorithmsinstall ;

HltAlgorithmsinstall :: $(install_dir)/$(HltAlgorithmsinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltAlgorithmsinstallname) :: $(bin)$(HltAlgorithmsinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltAlgorithmsinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltAlgorithmsclean :: HltAlgorithmsuninstall

uninstall :: HltAlgorithmsuninstall ;

HltAlgorithmsuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltAlgorithmsinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltAlgorithmsprototype)

$(bin)HltAlgorithms_dependencies.make : $(use_requirements) $(cmt_final_setup_HltAlgorithms)
	$(echo) "(HltAlgorithms.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)EFSectorHits.cc $(src)EFDetectorHits.cc $(src)IEFAlgorithm.cc $(src)SimpleRec.cc $(src)MuonRec.cc -end_all $(includes) $(app_HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) -name=HltAlgorithms $? -f=$(cmt_dependencies_in_HltAlgorithms) -without_cmt

-include $(bin)HltAlgorithms_dependencies.make

endif
endif
endif

HltAlgorithmsclean ::
	$(cleanup_silent) \rm -rf $(bin)HltAlgorithms_deps $(bin)HltAlgorithms_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFSectorHits.d

$(bin)$(binobj)EFSectorHits.d :

$(bin)$(binobj)EFSectorHits.o : $(cmt_final_setup_HltAlgorithms)

$(bin)$(binobj)EFSectorHits.o : $(src)EFSectorHits.cc
	$(cpp_echo) $(src)EFSectorHits.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(EFSectorHits_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(EFSectorHits_cppflags) $(EFSectorHits_cc_cppflags)  $(src)EFSectorHits.cc
endif
endif

else
$(bin)HltAlgorithms_dependencies.make : $(EFSectorHits_cc_dependencies)

$(bin)HltAlgorithms_dependencies.make : $(src)EFSectorHits.cc

$(bin)$(binobj)EFSectorHits.o : $(EFSectorHits_cc_dependencies)
	$(cpp_echo) $(src)EFSectorHits.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(EFSectorHits_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(EFSectorHits_cppflags) $(EFSectorHits_cc_cppflags)  $(src)EFSectorHits.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFDetectorHits.d

$(bin)$(binobj)EFDetectorHits.d :

$(bin)$(binobj)EFDetectorHits.o : $(cmt_final_setup_HltAlgorithms)

$(bin)$(binobj)EFDetectorHits.o : $(src)EFDetectorHits.cc
	$(cpp_echo) $(src)EFDetectorHits.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(EFDetectorHits_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(EFDetectorHits_cppflags) $(EFDetectorHits_cc_cppflags)  $(src)EFDetectorHits.cc
endif
endif

else
$(bin)HltAlgorithms_dependencies.make : $(EFDetectorHits_cc_dependencies)

$(bin)HltAlgorithms_dependencies.make : $(src)EFDetectorHits.cc

$(bin)$(binobj)EFDetectorHits.o : $(EFDetectorHits_cc_dependencies)
	$(cpp_echo) $(src)EFDetectorHits.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(EFDetectorHits_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(EFDetectorHits_cppflags) $(EFDetectorHits_cc_cppflags)  $(src)EFDetectorHits.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)IEFAlgorithm.d

$(bin)$(binobj)IEFAlgorithm.d :

$(bin)$(binobj)IEFAlgorithm.o : $(cmt_final_setup_HltAlgorithms)

$(bin)$(binobj)IEFAlgorithm.o : $(src)IEFAlgorithm.cc
	$(cpp_echo) $(src)IEFAlgorithm.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(IEFAlgorithm_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(IEFAlgorithm_cppflags) $(IEFAlgorithm_cc_cppflags)  $(src)IEFAlgorithm.cc
endif
endif

else
$(bin)HltAlgorithms_dependencies.make : $(IEFAlgorithm_cc_dependencies)

$(bin)HltAlgorithms_dependencies.make : $(src)IEFAlgorithm.cc

$(bin)$(binobj)IEFAlgorithm.o : $(IEFAlgorithm_cc_dependencies)
	$(cpp_echo) $(src)IEFAlgorithm.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(IEFAlgorithm_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(IEFAlgorithm_cppflags) $(IEFAlgorithm_cc_cppflags)  $(src)IEFAlgorithm.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SimpleRec.d

$(bin)$(binobj)SimpleRec.d :

$(bin)$(binobj)SimpleRec.o : $(cmt_final_setup_HltAlgorithms)

$(bin)$(binobj)SimpleRec.o : $(src)SimpleRec.cc
	$(cpp_echo) $(src)SimpleRec.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(SimpleRec_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(SimpleRec_cppflags) $(SimpleRec_cc_cppflags)  $(src)SimpleRec.cc
endif
endif

else
$(bin)HltAlgorithms_dependencies.make : $(SimpleRec_cc_dependencies)

$(bin)HltAlgorithms_dependencies.make : $(src)SimpleRec.cc

$(bin)$(binobj)SimpleRec.o : $(SimpleRec_cc_dependencies)
	$(cpp_echo) $(src)SimpleRec.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(SimpleRec_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(SimpleRec_cppflags) $(SimpleRec_cc_cppflags)  $(src)SimpleRec.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)MuonRec.d

$(bin)$(binobj)MuonRec.d :

$(bin)$(binobj)MuonRec.o : $(cmt_final_setup_HltAlgorithms)

$(bin)$(binobj)MuonRec.o : $(src)MuonRec.cc
	$(cpp_echo) $(src)MuonRec.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(MuonRec_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(MuonRec_cppflags) $(MuonRec_cc_cppflags)  $(src)MuonRec.cc
endif
endif

else
$(bin)HltAlgorithms_dependencies.make : $(MuonRec_cc_dependencies)

$(bin)HltAlgorithms_dependencies.make : $(src)MuonRec.cc

$(bin)$(binobj)MuonRec.o : $(MuonRec_cc_dependencies)
	$(cpp_echo) $(src)MuonRec.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltAlgorithms_pp_cppflags) $(lib_HltAlgorithms_pp_cppflags) $(MuonRec_pp_cppflags) $(use_cppflags) $(HltAlgorithms_cppflags) $(lib_HltAlgorithms_cppflags) $(MuonRec_cppflags) $(MuonRec_cc_cppflags)  $(src)MuonRec.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltAlgorithmsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltAlgorithms.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltAlgorithmsclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltAlgorithms
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltAlgorithms$(library_suffix).a $(library_prefix)HltAlgorithms$(library_suffix).$(shlibsuffix) HltAlgorithms.stamp HltAlgorithms.shstamp
#-- end of cleanup_library ---------------
