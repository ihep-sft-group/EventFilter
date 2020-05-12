#-- start of make_header -----------------

#====================================
#  Library HltResult
#
#   Generated Tue May 12 17:44:48 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltResult_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltResult_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltResult

HltResult_tag = $(tag)

#cmt_local_tagfile_HltResult = $(HltResult_tag)_HltResult.make
cmt_local_tagfile_HltResult = $(bin)$(HltResult_tag)_HltResult.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltResult_tag = $(tag)

#cmt_local_tagfile_HltResult = $(HltResult_tag).make
cmt_local_tagfile_HltResult = $(bin)$(HltResult_tag).make

endif

include $(cmt_local_tagfile_HltResult)
#-include $(cmt_local_tagfile_HltResult)

ifdef cmt_HltResult_has_target_tag

cmt_final_setup_HltResult = $(bin)setup_HltResult.make
cmt_dependencies_in_HltResult = $(bin)dependencies_HltResult.in
#cmt_final_setup_HltResult = $(bin)HltResult_HltResultsetup.make
cmt_local_HltResult_makefile = $(bin)HltResult.make

else

cmt_final_setup_HltResult = $(bin)setup.make
cmt_dependencies_in_HltResult = $(bin)dependencies.in
#cmt_final_setup_HltResult = $(bin)HltResultsetup.make
cmt_local_HltResult_makefile = $(bin)HltResult.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltResultsetup.make

#HltResult :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltResult'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltResult/
#HltResult::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltResultlibname   = $(bin)$(library_prefix)HltResult$(library_suffix)
HltResultlib       = $(HltResultlibname).a
HltResultstamp     = $(bin)HltResult.stamp
HltResultshstamp   = $(bin)HltResult.shstamp

HltResult :: dirs  HltResultLIB
	$(echo) "HltResult ok"

cmt_HltResult_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltResult_has_prototypes

HltResultprototype :  ;

endif

HltResultcompile : $(bin)ExampleGetResult.o $(bin)HltResultSvc.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltResultLIB :: $(HltResultlib) $(HltResultshstamp)
	$(echo) "HltResult : library ok"

$(HltResultlib) :: $(bin)ExampleGetResult.o $(bin)HltResultSvc.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltResultlib) $(bin)ExampleGetResult.o $(bin)HltResultSvc.o
	$(lib_silent) $(ranlib) $(HltResultlib)
	$(lib_silent) cat /dev/null >$(HltResultstamp)

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

$(HltResultlibname).$(shlibsuffix) :: $(HltResultlib) requirements $(use_requirements) $(HltResultstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltResult $(HltResult_shlibflags)
	$(lib_silent) cat /dev/null >$(HltResultshstamp)

$(HltResultshstamp) :: $(HltResultlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltResultlibname).$(shlibsuffix) ; then cat /dev/null >$(HltResultshstamp) ; fi

HltResultclean ::
	$(cleanup_echo) objects HltResult
	$(cleanup_silent) /bin/rm -f $(bin)ExampleGetResult.o $(bin)HltResultSvc.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)ExampleGetResult.o $(bin)HltResultSvc.o) $(patsubst %.o,%.dep,$(bin)ExampleGetResult.o $(bin)HltResultSvc.o) $(patsubst %.o,%.d.stamp,$(bin)ExampleGetResult.o $(bin)HltResultSvc.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltResult_deps HltResult_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltResultinstallname = $(library_prefix)HltResult$(library_suffix).$(shlibsuffix)

HltResult :: HltResultinstall ;

install :: HltResultinstall ;

HltResultinstall :: $(install_dir)/$(HltResultinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltResultinstallname) :: $(bin)$(HltResultinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltResultinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltResultclean :: HltResultuninstall

uninstall :: HltResultuninstall ;

HltResultuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltResultinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltResultclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltResultprototype)

$(bin)HltResult_dependencies.make : $(use_requirements) $(cmt_final_setup_HltResult)
	$(echo) "(HltResult.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)ExampleGetResult.cc $(src)HltResultSvc.cc -end_all $(includes) $(app_HltResult_cppflags) $(lib_HltResult_cppflags) -name=HltResult $? -f=$(cmt_dependencies_in_HltResult) -without_cmt

-include $(bin)HltResult_dependencies.make

endif
endif
endif

HltResultclean ::
	$(cleanup_silent) \rm -rf $(bin)HltResult_deps $(bin)HltResult_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltResultclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleGetResult.d

$(bin)$(binobj)ExampleGetResult.d :

$(bin)$(binobj)ExampleGetResult.o : $(cmt_final_setup_HltResult)

$(bin)$(binobj)ExampleGetResult.o : $(src)ExampleGetResult.cc
	$(cpp_echo) $(src)ExampleGetResult.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltResult_pp_cppflags) $(lib_HltResult_pp_cppflags) $(ExampleGetResult_pp_cppflags) $(use_cppflags) $(HltResult_cppflags) $(lib_HltResult_cppflags) $(ExampleGetResult_cppflags) $(ExampleGetResult_cc_cppflags)  $(src)ExampleGetResult.cc
endif
endif

else
$(bin)HltResult_dependencies.make : $(ExampleGetResult_cc_dependencies)

$(bin)HltResult_dependencies.make : $(src)ExampleGetResult.cc

$(bin)$(binobj)ExampleGetResult.o : $(ExampleGetResult_cc_dependencies)
	$(cpp_echo) $(src)ExampleGetResult.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltResult_pp_cppflags) $(lib_HltResult_pp_cppflags) $(ExampleGetResult_pp_cppflags) $(use_cppflags) $(HltResult_cppflags) $(lib_HltResult_cppflags) $(ExampleGetResult_cppflags) $(ExampleGetResult_cc_cppflags)  $(src)ExampleGetResult.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltResultclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)HltResultSvc.d

$(bin)$(binobj)HltResultSvc.d :

$(bin)$(binobj)HltResultSvc.o : $(cmt_final_setup_HltResult)

$(bin)$(binobj)HltResultSvc.o : $(src)HltResultSvc.cc
	$(cpp_echo) $(src)HltResultSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltResult_pp_cppflags) $(lib_HltResult_pp_cppflags) $(HltResultSvc_pp_cppflags) $(use_cppflags) $(HltResult_cppflags) $(lib_HltResult_cppflags) $(HltResultSvc_cppflags) $(HltResultSvc_cc_cppflags)  $(src)HltResultSvc.cc
endif
endif

else
$(bin)HltResult_dependencies.make : $(HltResultSvc_cc_dependencies)

$(bin)HltResult_dependencies.make : $(src)HltResultSvc.cc

$(bin)$(binobj)HltResultSvc.o : $(HltResultSvc_cc_dependencies)
	$(cpp_echo) $(src)HltResultSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltResult_pp_cppflags) $(lib_HltResult_pp_cppflags) $(HltResultSvc_pp_cppflags) $(use_cppflags) $(HltResult_cppflags) $(lib_HltResult_cppflags) $(HltResultSvc_cppflags) $(HltResultSvc_cc_cppflags)  $(src)HltResultSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltResultclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltResult.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltResultclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltResult
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltResult$(library_suffix).a $(library_prefix)HltResult$(library_suffix).$(shlibsuffix) HltResult.stamp HltResult.shstamp
#-- end of cleanup_library ---------------
