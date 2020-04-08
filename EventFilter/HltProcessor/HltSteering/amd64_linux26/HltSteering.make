#-- start of make_header -----------------

#====================================
#  Library HltSteering
#
#   Generated Tue Apr  7 10:27:05 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltSteering_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltSteering_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltSteering

HltSteering_tag = $(tag)

#cmt_local_tagfile_HltSteering = $(HltSteering_tag)_HltSteering.make
cmt_local_tagfile_HltSteering = $(bin)$(HltSteering_tag)_HltSteering.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltSteering_tag = $(tag)

#cmt_local_tagfile_HltSteering = $(HltSteering_tag).make
cmt_local_tagfile_HltSteering = $(bin)$(HltSteering_tag).make

endif

include $(cmt_local_tagfile_HltSteering)
#-include $(cmt_local_tagfile_HltSteering)

ifdef cmt_HltSteering_has_target_tag

cmt_final_setup_HltSteering = $(bin)setup_HltSteering.make
cmt_dependencies_in_HltSteering = $(bin)dependencies_HltSteering.in
#cmt_final_setup_HltSteering = $(bin)HltSteering_HltSteeringsetup.make
cmt_local_HltSteering_makefile = $(bin)HltSteering.make

else

cmt_final_setup_HltSteering = $(bin)setup.make
cmt_dependencies_in_HltSteering = $(bin)dependencies.in
#cmt_final_setup_HltSteering = $(bin)HltSteeringsetup.make
cmt_local_HltSteering_makefile = $(bin)HltSteering.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltSteeringsetup.make

#HltSteering :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltSteering'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltSteering/
#HltSteering::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltSteeringlibname   = $(bin)$(library_prefix)HltSteering$(library_suffix)
HltSteeringlib       = $(HltSteeringlibname).a
HltSteeringstamp     = $(bin)HltSteering.stamp
HltSteeringshstamp   = $(bin)HltSteering.shstamp

HltSteering :: dirs  HltSteeringLIB
	$(echo) "HltSteering ok"

cmt_HltSteering_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltSteering_has_prototypes

HltSteeringprototype :  ;

endif

HltSteeringcompile : $(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltSteeringLIB :: $(HltSteeringlib) $(HltSteeringshstamp)
	$(echo) "HltSteering : library ok"

$(HltSteeringlib) :: $(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltSteeringlib) $(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o
	$(lib_silent) $(ranlib) $(HltSteeringlib)
	$(lib_silent) cat /dev/null >$(HltSteeringstamp)

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

$(HltSteeringlibname).$(shlibsuffix) :: $(HltSteeringlib) requirements $(use_requirements) $(HltSteeringstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltSteering $(HltSteering_shlibflags)
	$(lib_silent) cat /dev/null >$(HltSteeringshstamp)

$(HltSteeringshstamp) :: $(HltSteeringlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltSteeringlibname).$(shlibsuffix) ; then cat /dev/null >$(HltSteeringshstamp) ; fi

HltSteeringclean ::
	$(cleanup_echo) objects HltSteering
	$(cleanup_silent) /bin/rm -f $(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o) $(patsubst %.o,%.dep,$(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o) $(patsubst %.o,%.d.stamp,$(bin)StepSequencer.o $(bin)StepHandler.o $(bin)StepDecision.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltSteering_deps HltSteering_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltSteeringinstallname = $(library_prefix)HltSteering$(library_suffix).$(shlibsuffix)

HltSteering :: HltSteeringinstall ;

install :: HltSteeringinstall ;

HltSteeringinstall :: $(install_dir)/$(HltSteeringinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltSteeringinstallname) :: $(bin)$(HltSteeringinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltSteeringinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltSteeringclean :: HltSteeringuninstall

uninstall :: HltSteeringuninstall ;

HltSteeringuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltSteeringinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltSteeringclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltSteeringprototype)

$(bin)HltSteering_dependencies.make : $(use_requirements) $(cmt_final_setup_HltSteering)
	$(echo) "(HltSteering.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)StepSequencer.cc $(src)StepHandler.cc $(src)StepDecision.cc -end_all $(includes) $(app_HltSteering_cppflags) $(lib_HltSteering_cppflags) -name=HltSteering $? -f=$(cmt_dependencies_in_HltSteering) -without_cmt

-include $(bin)HltSteering_dependencies.make

endif
endif
endif

HltSteeringclean ::
	$(cleanup_silent) \rm -rf $(bin)HltSteering_deps $(bin)HltSteering_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteeringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)StepSequencer.d

$(bin)$(binobj)StepSequencer.d :

$(bin)$(binobj)StepSequencer.o : $(cmt_final_setup_HltSteering)

$(bin)$(binobj)StepSequencer.o : $(src)StepSequencer.cc
	$(cpp_echo) $(src)StepSequencer.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepSequencer_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepSequencer_cppflags) $(StepSequencer_cc_cppflags)  $(src)StepSequencer.cc
endif
endif

else
$(bin)HltSteering_dependencies.make : $(StepSequencer_cc_dependencies)

$(bin)HltSteering_dependencies.make : $(src)StepSequencer.cc

$(bin)$(binobj)StepSequencer.o : $(StepSequencer_cc_dependencies)
	$(cpp_echo) $(src)StepSequencer.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepSequencer_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepSequencer_cppflags) $(StepSequencer_cc_cppflags)  $(src)StepSequencer.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteeringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)StepHandler.d

$(bin)$(binobj)StepHandler.d :

$(bin)$(binobj)StepHandler.o : $(cmt_final_setup_HltSteering)

$(bin)$(binobj)StepHandler.o : $(src)StepHandler.cc
	$(cpp_echo) $(src)StepHandler.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepHandler_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepHandler_cppflags) $(StepHandler_cc_cppflags)  $(src)StepHandler.cc
endif
endif

else
$(bin)HltSteering_dependencies.make : $(StepHandler_cc_dependencies)

$(bin)HltSteering_dependencies.make : $(src)StepHandler.cc

$(bin)$(binobj)StepHandler.o : $(StepHandler_cc_dependencies)
	$(cpp_echo) $(src)StepHandler.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepHandler_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepHandler_cppflags) $(StepHandler_cc_cppflags)  $(src)StepHandler.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteeringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)StepDecision.d

$(bin)$(binobj)StepDecision.d :

$(bin)$(binobj)StepDecision.o : $(cmt_final_setup_HltSteering)

$(bin)$(binobj)StepDecision.o : $(src)StepDecision.cc
	$(cpp_echo) $(src)StepDecision.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepDecision_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepDecision_cppflags) $(StepDecision_cc_cppflags)  $(src)StepDecision.cc
endif
endif

else
$(bin)HltSteering_dependencies.make : $(StepDecision_cc_dependencies)

$(bin)HltSteering_dependencies.make : $(src)StepDecision.cc

$(bin)$(binobj)StepDecision.o : $(StepDecision_cc_dependencies)
	$(cpp_echo) $(src)StepDecision.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteering_pp_cppflags) $(lib_HltSteering_pp_cppflags) $(StepDecision_pp_cppflags) $(use_cppflags) $(HltSteering_cppflags) $(lib_HltSteering_cppflags) $(StepDecision_cppflags) $(StepDecision_cc_cppflags)  $(src)StepDecision.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltSteeringclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltSteering.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltSteeringclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltSteering
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltSteering$(library_suffix).a $(library_prefix)HltSteering$(library_suffix).$(shlibsuffix) HltSteering.stamp HltSteering.shstamp
#-- end of cleanup_library ---------------
