#-- start of make_header -----------------

#====================================
#  Library HltSteerData
#
#   Generated Mon May 11 20:57:21 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltSteerData_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltSteerData_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltSteerData

HltSteerData_tag = $(tag)

#cmt_local_tagfile_HltSteerData = $(HltSteerData_tag)_HltSteerData.make
cmt_local_tagfile_HltSteerData = $(bin)$(HltSteerData_tag)_HltSteerData.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltSteerData_tag = $(tag)

#cmt_local_tagfile_HltSteerData = $(HltSteerData_tag).make
cmt_local_tagfile_HltSteerData = $(bin)$(HltSteerData_tag).make

endif

include $(cmt_local_tagfile_HltSteerData)
#-include $(cmt_local_tagfile_HltSteerData)

ifdef cmt_HltSteerData_has_target_tag

cmt_final_setup_HltSteerData = $(bin)setup_HltSteerData.make
cmt_dependencies_in_HltSteerData = $(bin)dependencies_HltSteerData.in
#cmt_final_setup_HltSteerData = $(bin)HltSteerData_HltSteerDatasetup.make
cmt_local_HltSteerData_makefile = $(bin)HltSteerData.make

else

cmt_final_setup_HltSteerData = $(bin)setup.make
cmt_dependencies_in_HltSteerData = $(bin)dependencies.in
#cmt_final_setup_HltSteerData = $(bin)HltSteerDatasetup.make
cmt_local_HltSteerData_makefile = $(bin)HltSteerData.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltSteerDatasetup.make

#HltSteerData :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltSteerData'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltSteerData/
#HltSteerData::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltSteerDatalibname   = $(bin)$(library_prefix)HltSteerData$(library_suffix)
HltSteerDatalib       = $(HltSteerDatalibname).a
HltSteerDatastamp     = $(bin)HltSteerData.stamp
HltSteerDatashstamp   = $(bin)HltSteerData.shstamp

HltSteerData :: dirs  HltSteerDataLIB
	$(echo) "HltSteerData ok"

cmt_HltSteerData_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltSteerData_has_prototypes

HltSteerDataprototype :  ;

endif

HltSteerDatacompile : $(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltSteerDataLIB :: $(HltSteerDatalib) $(HltSteerDatashstamp)
	$(echo) "HltSteerData : library ok"

$(HltSteerDatalib) :: $(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltSteerDatalib) $(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o
	$(lib_silent) $(ranlib) $(HltSteerDatalib)
	$(lib_silent) cat /dev/null >$(HltSteerDatastamp)

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

$(HltSteerDatalibname).$(shlibsuffix) :: $(HltSteerDatalib) requirements $(use_requirements) $(HltSteerDatastamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltSteerData $(HltSteerData_shlibflags)
	$(lib_silent) cat /dev/null >$(HltSteerDatashstamp)

$(HltSteerDatashstamp) :: $(HltSteerDatalibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltSteerDatalibname).$(shlibsuffix) ; then cat /dev/null >$(HltSteerDatashstamp) ; fi

HltSteerDataclean ::
	$(cleanup_echo) objects HltSteerData
	$(cleanup_silent) /bin/rm -f $(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o) $(patsubst %.o,%.dep,$(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o) $(patsubst %.o,%.d.stamp,$(bin)Signature.o $(bin)Sequence.o $(bin)HltCriteria.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltSteerData_deps HltSteerData_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltSteerDatainstallname = $(library_prefix)HltSteerData$(library_suffix).$(shlibsuffix)

HltSteerData :: HltSteerDatainstall ;

install :: HltSteerDatainstall ;

HltSteerDatainstall :: $(install_dir)/$(HltSteerDatainstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltSteerDatainstallname) :: $(bin)$(HltSteerDatainstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltSteerDatainstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltSteerDataclean :: HltSteerDatauninstall

uninstall :: HltSteerDatauninstall ;

HltSteerDatauninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltSteerDatainstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltSteerDataclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltSteerDataprototype)

$(bin)HltSteerData_dependencies.make : $(use_requirements) $(cmt_final_setup_HltSteerData)
	$(echo) "(HltSteerData.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)Signature.cc $(src)Sequence.cc $(src)HltCriteria.cc -end_all $(includes) $(app_HltSteerData_cppflags) $(lib_HltSteerData_cppflags) -name=HltSteerData $? -f=$(cmt_dependencies_in_HltSteerData) -without_cmt

-include $(bin)HltSteerData_dependencies.make

endif
endif
endif

HltSteerDataclean ::
	$(cleanup_silent) \rm -rf $(bin)HltSteerData_deps $(bin)HltSteerData_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteerDataclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Signature.d

$(bin)$(binobj)Signature.d :

$(bin)$(binobj)Signature.o : $(cmt_final_setup_HltSteerData)

$(bin)$(binobj)Signature.o : $(src)Signature.cc
	$(cpp_echo) $(src)Signature.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(Signature_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(Signature_cppflags) $(Signature_cc_cppflags)  $(src)Signature.cc
endif
endif

else
$(bin)HltSteerData_dependencies.make : $(Signature_cc_dependencies)

$(bin)HltSteerData_dependencies.make : $(src)Signature.cc

$(bin)$(binobj)Signature.o : $(Signature_cc_dependencies)
	$(cpp_echo) $(src)Signature.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(Signature_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(Signature_cppflags) $(Signature_cc_cppflags)  $(src)Signature.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteerDataclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Sequence.d

$(bin)$(binobj)Sequence.d :

$(bin)$(binobj)Sequence.o : $(cmt_final_setup_HltSteerData)

$(bin)$(binobj)Sequence.o : $(src)Sequence.cc
	$(cpp_echo) $(src)Sequence.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(Sequence_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(Sequence_cppflags) $(Sequence_cc_cppflags)  $(src)Sequence.cc
endif
endif

else
$(bin)HltSteerData_dependencies.make : $(Sequence_cc_dependencies)

$(bin)HltSteerData_dependencies.make : $(src)Sequence.cc

$(bin)$(binobj)Sequence.o : $(Sequence_cc_dependencies)
	$(cpp_echo) $(src)Sequence.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(Sequence_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(Sequence_cppflags) $(Sequence_cc_cppflags)  $(src)Sequence.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltSteerDataclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)HltCriteria.d

$(bin)$(binobj)HltCriteria.d :

$(bin)$(binobj)HltCriteria.o : $(cmt_final_setup_HltSteerData)

$(bin)$(binobj)HltCriteria.o : $(src)HltCriteria.cc
	$(cpp_echo) $(src)HltCriteria.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(HltCriteria_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(HltCriteria_cppflags) $(HltCriteria_cc_cppflags)  $(src)HltCriteria.cc
endif
endif

else
$(bin)HltSteerData_dependencies.make : $(HltCriteria_cc_dependencies)

$(bin)HltSteerData_dependencies.make : $(src)HltCriteria.cc

$(bin)$(binobj)HltCriteria.o : $(HltCriteria_cc_dependencies)
	$(cpp_echo) $(src)HltCriteria.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltSteerData_pp_cppflags) $(lib_HltSteerData_pp_cppflags) $(HltCriteria_pp_cppflags) $(use_cppflags) $(HltSteerData_cppflags) $(lib_HltSteerData_cppflags) $(HltCriteria_cppflags) $(HltCriteria_cc_cppflags)  $(src)HltCriteria.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltSteerDataclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltSteerData.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltSteerDataclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltSteerData
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltSteerData$(library_suffix).a $(library_prefix)HltSteerData$(library_suffix).$(shlibsuffix) HltSteerData.stamp HltSteerData.shstamp
#-- end of cleanup_library ---------------
