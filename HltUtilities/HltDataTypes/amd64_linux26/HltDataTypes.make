#-- start of make_header -----------------

#====================================
#  Library HltDataTypes
#
#   Generated Tue May 12 11:18:32 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltDataTypes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltDataTypes_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltDataTypes

HltUtilities_tag = $(tag)

#cmt_local_tagfile_HltDataTypes = $(HltUtilities_tag)_HltDataTypes.make
cmt_local_tagfile_HltDataTypes = $(bin)$(HltUtilities_tag)_HltDataTypes.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltUtilities_tag = $(tag)

#cmt_local_tagfile_HltDataTypes = $(HltUtilities_tag).make
cmt_local_tagfile_HltDataTypes = $(bin)$(HltUtilities_tag).make

endif

include $(cmt_local_tagfile_HltDataTypes)
#-include $(cmt_local_tagfile_HltDataTypes)

ifdef cmt_HltDataTypes_has_target_tag

cmt_final_setup_HltDataTypes = $(bin)setup_HltDataTypes.make
cmt_dependencies_in_HltDataTypes = $(bin)dependencies_HltDataTypes.in
#cmt_final_setup_HltDataTypes = $(bin)HltUtilities_HltDataTypessetup.make
cmt_local_HltDataTypes_makefile = $(bin)HltDataTypes.make

else

cmt_final_setup_HltDataTypes = $(bin)setup.make
cmt_dependencies_in_HltDataTypes = $(bin)dependencies.in
#cmt_final_setup_HltDataTypes = $(bin)HltUtilitiessetup.make
cmt_local_HltDataTypes_makefile = $(bin)HltDataTypes.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltUtilitiessetup.make

#HltDataTypes :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltDataTypes'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltDataTypes/
#HltDataTypes::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltDataTypeslibname   = $(bin)$(library_prefix)HltDataTypes$(library_suffix)
HltDataTypeslib       = $(HltDataTypeslibname).a
HltDataTypesstamp     = $(bin)HltDataTypes.stamp
HltDataTypesshstamp   = $(bin)HltDataTypes.shstamp

HltDataTypes :: dirs  HltDataTypesLIB
	$(echo) "HltDataTypes ok"

cmt_HltDataTypes_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltDataTypes_has_prototypes

HltDataTypesprototype :  ;

endif

HltDataTypescompile : $(bin)EFResult.o $(bin)CriteriaItemValue.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltDataTypesLIB :: $(HltDataTypeslib) $(HltDataTypesshstamp)
	$(echo) "HltDataTypes : library ok"

$(HltDataTypeslib) :: $(bin)EFResult.o $(bin)CriteriaItemValue.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltDataTypeslib) $(bin)EFResult.o $(bin)CriteriaItemValue.o
	$(lib_silent) $(ranlib) $(HltDataTypeslib)
	$(lib_silent) cat /dev/null >$(HltDataTypesstamp)

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

$(HltDataTypeslibname).$(shlibsuffix) :: $(HltDataTypeslib) requirements $(use_requirements) $(HltDataTypesstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltDataTypes $(HltDataTypes_shlibflags)
	$(lib_silent) cat /dev/null >$(HltDataTypesshstamp)

$(HltDataTypesshstamp) :: $(HltDataTypeslibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltDataTypeslibname).$(shlibsuffix) ; then cat /dev/null >$(HltDataTypesshstamp) ; fi

HltDataTypesclean ::
	$(cleanup_echo) objects HltDataTypes
	$(cleanup_silent) /bin/rm -f $(bin)EFResult.o $(bin)CriteriaItemValue.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)EFResult.o $(bin)CriteriaItemValue.o) $(patsubst %.o,%.dep,$(bin)EFResult.o $(bin)CriteriaItemValue.o) $(patsubst %.o,%.d.stamp,$(bin)EFResult.o $(bin)CriteriaItemValue.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltDataTypes_deps HltDataTypes_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltDataTypesinstallname = $(library_prefix)HltDataTypes$(library_suffix).$(shlibsuffix)

HltDataTypes :: HltDataTypesinstall ;

install :: HltDataTypesinstall ;

HltDataTypesinstall :: $(install_dir)/$(HltDataTypesinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltDataTypesinstallname) :: $(bin)$(HltDataTypesinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltDataTypesinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltDataTypesclean :: HltDataTypesuninstall

uninstall :: HltDataTypesuninstall ;

HltDataTypesuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltDataTypesinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltDataTypesclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltDataTypesprototype)

$(bin)HltDataTypes_dependencies.make : $(use_requirements) $(cmt_final_setup_HltDataTypes)
	$(echo) "(HltDataTypes.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)EFResult.cc $(src)CriteriaItemValue.cc -end_all $(includes) $(app_HltDataTypes_cppflags) $(lib_HltDataTypes_cppflags) -name=HltDataTypes $? -f=$(cmt_dependencies_in_HltDataTypes) -without_cmt

-include $(bin)HltDataTypes_dependencies.make

endif
endif
endif

HltDataTypesclean ::
	$(cleanup_silent) \rm -rf $(bin)HltDataTypes_deps $(bin)HltDataTypes_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltDataTypesclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFResult.d

$(bin)$(binobj)EFResult.d :

$(bin)$(binobj)EFResult.o : $(cmt_final_setup_HltDataTypes)

$(bin)$(binobj)EFResult.o : $(src)EFResult.cc
	$(cpp_echo) $(src)EFResult.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltDataTypes_pp_cppflags) $(lib_HltDataTypes_pp_cppflags) $(EFResult_pp_cppflags) $(use_cppflags) $(HltDataTypes_cppflags) $(lib_HltDataTypes_cppflags) $(EFResult_cppflags) $(EFResult_cc_cppflags)  $(src)EFResult.cc
endif
endif

else
$(bin)HltDataTypes_dependencies.make : $(EFResult_cc_dependencies)

$(bin)HltDataTypes_dependencies.make : $(src)EFResult.cc

$(bin)$(binobj)EFResult.o : $(EFResult_cc_dependencies)
	$(cpp_echo) $(src)EFResult.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltDataTypes_pp_cppflags) $(lib_HltDataTypes_pp_cppflags) $(EFResult_pp_cppflags) $(use_cppflags) $(HltDataTypes_cppflags) $(lib_HltDataTypes_cppflags) $(EFResult_cppflags) $(EFResult_cc_cppflags)  $(src)EFResult.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltDataTypesclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)CriteriaItemValue.d

$(bin)$(binobj)CriteriaItemValue.d :

$(bin)$(binobj)CriteriaItemValue.o : $(cmt_final_setup_HltDataTypes)

$(bin)$(binobj)CriteriaItemValue.o : $(src)CriteriaItemValue.cc
	$(cpp_echo) $(src)CriteriaItemValue.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltDataTypes_pp_cppflags) $(lib_HltDataTypes_pp_cppflags) $(CriteriaItemValue_pp_cppflags) $(use_cppflags) $(HltDataTypes_cppflags) $(lib_HltDataTypes_cppflags) $(CriteriaItemValue_cppflags) $(CriteriaItemValue_cc_cppflags)  $(src)CriteriaItemValue.cc
endif
endif

else
$(bin)HltDataTypes_dependencies.make : $(CriteriaItemValue_cc_dependencies)

$(bin)HltDataTypes_dependencies.make : $(src)CriteriaItemValue.cc

$(bin)$(binobj)CriteriaItemValue.o : $(CriteriaItemValue_cc_dependencies)
	$(cpp_echo) $(src)CriteriaItemValue.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltDataTypes_pp_cppflags) $(lib_HltDataTypes_pp_cppflags) $(CriteriaItemValue_pp_cppflags) $(use_cppflags) $(HltDataTypes_cppflags) $(lib_HltDataTypes_cppflags) $(CriteriaItemValue_cppflags) $(CriteriaItemValue_cc_cppflags)  $(src)CriteriaItemValue.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltDataTypesclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltDataTypes.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltDataTypesclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltDataTypes
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltDataTypes$(library_suffix).a $(library_prefix)HltDataTypes$(library_suffix).$(shlibsuffix) HltDataTypes.stamp HltDataTypes.shstamp
#-- end of cleanup_library ---------------
