#-- start of make_header -----------------

#====================================
#  Library HltConfig
#
#   Generated Tue Apr  7 10:24:23 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltConfig_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltConfig_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltConfig

HltConfig_tag = $(tag)

#cmt_local_tagfile_HltConfig = $(HltConfig_tag)_HltConfig.make
cmt_local_tagfile_HltConfig = $(bin)$(HltConfig_tag)_HltConfig.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltConfig_tag = $(tag)

#cmt_local_tagfile_HltConfig = $(HltConfig_tag).make
cmt_local_tagfile_HltConfig = $(bin)$(HltConfig_tag).make

endif

include $(cmt_local_tagfile_HltConfig)
#-include $(cmt_local_tagfile_HltConfig)

ifdef cmt_HltConfig_has_target_tag

cmt_final_setup_HltConfig = $(bin)setup_HltConfig.make
cmt_dependencies_in_HltConfig = $(bin)dependencies_HltConfig.in
#cmt_final_setup_HltConfig = $(bin)HltConfig_HltConfigsetup.make
cmt_local_HltConfig_makefile = $(bin)HltConfig.make

else

cmt_final_setup_HltConfig = $(bin)setup.make
cmt_dependencies_in_HltConfig = $(bin)dependencies.in
#cmt_final_setup_HltConfig = $(bin)HltConfigsetup.make
cmt_local_HltConfig_makefile = $(bin)HltConfig.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltConfigsetup.make

#HltConfig :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltConfig'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltConfig/
#HltConfig::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltConfiglibname   = $(bin)$(library_prefix)HltConfig$(library_suffix)
HltConfiglib       = $(HltConfiglibname).a
HltConfigstamp     = $(bin)HltConfig.stamp
HltConfigshstamp   = $(bin)HltConfig.shstamp

HltConfig :: dirs  HltConfigLIB
	$(echo) "HltConfig ok"

cmt_HltConfig_has_prototypes = 1

#--------------------------------------

ifdef cmt_HltConfig_has_prototypes

HltConfigprototype :  ;

endif

HltConfigcompile : $(bin)HltConfigSvc.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

HltConfigLIB :: $(HltConfiglib) $(HltConfigshstamp)
	$(echo) "HltConfig : library ok"

$(HltConfiglib) :: $(bin)HltConfigSvc.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(HltConfiglib) $(bin)HltConfigSvc.o
	$(lib_silent) $(ranlib) $(HltConfiglib)
	$(lib_silent) cat /dev/null >$(HltConfigstamp)

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

$(HltConfiglibname).$(shlibsuffix) :: $(HltConfiglib) requirements $(use_requirements) $(HltConfigstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" HltConfig $(HltConfig_shlibflags)
	$(lib_silent) cat /dev/null >$(HltConfigshstamp)

$(HltConfigshstamp) :: $(HltConfiglibname).$(shlibsuffix)
	$(lib_silent) if test -f $(HltConfiglibname).$(shlibsuffix) ; then cat /dev/null >$(HltConfigshstamp) ; fi

HltConfigclean ::
	$(cleanup_echo) objects HltConfig
	$(cleanup_silent) /bin/rm -f $(bin)HltConfigSvc.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)HltConfigSvc.o) $(patsubst %.o,%.dep,$(bin)HltConfigSvc.o) $(patsubst %.o,%.d.stamp,$(bin)HltConfigSvc.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf HltConfig_deps HltConfig_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
HltConfiginstallname = $(library_prefix)HltConfig$(library_suffix).$(shlibsuffix)

HltConfig :: HltConfiginstall ;

install :: HltConfiginstall ;

HltConfiginstall :: $(install_dir)/$(HltConfiginstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(HltConfiginstallname) :: $(bin)$(HltConfiginstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltConfiginstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##HltConfigclean :: HltConfiguninstall

uninstall :: HltConfiguninstall ;

HltConfiguninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(HltConfiginstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),HltConfigclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),HltConfigprototype)

$(bin)HltConfig_dependencies.make : $(use_requirements) $(cmt_final_setup_HltConfig)
	$(echo) "(HltConfig.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)HltConfigSvc.cc -end_all $(includes) $(app_HltConfig_cppflags) $(lib_HltConfig_cppflags) -name=HltConfig $? -f=$(cmt_dependencies_in_HltConfig) -without_cmt

-include $(bin)HltConfig_dependencies.make

endif
endif
endif

HltConfigclean ::
	$(cleanup_silent) \rm -rf $(bin)HltConfig_deps $(bin)HltConfig_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),HltConfigclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)HltConfigSvc.d

$(bin)$(binobj)HltConfigSvc.d :

$(bin)$(binobj)HltConfigSvc.o : $(cmt_final_setup_HltConfig)

$(bin)$(binobj)HltConfigSvc.o : $(src)HltConfigSvc.cc
	$(cpp_echo) $(src)HltConfigSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(HltConfig_pp_cppflags) $(lib_HltConfig_pp_cppflags) $(HltConfigSvc_pp_cppflags) $(use_cppflags) $(HltConfig_cppflags) $(lib_HltConfig_cppflags) $(HltConfigSvc_cppflags) $(HltConfigSvc_cc_cppflags)  $(src)HltConfigSvc.cc
endif
endif

else
$(bin)HltConfig_dependencies.make : $(HltConfigSvc_cc_dependencies)

$(bin)HltConfig_dependencies.make : $(src)HltConfigSvc.cc

$(bin)$(binobj)HltConfigSvc.o : $(HltConfigSvc_cc_dependencies)
	$(cpp_echo) $(src)HltConfigSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltConfig_pp_cppflags) $(lib_HltConfig_pp_cppflags) $(HltConfigSvc_pp_cppflags) $(use_cppflags) $(HltConfig_cppflags) $(lib_HltConfig_cppflags) $(HltConfigSvc_cppflags) $(HltConfigSvc_cc_cppflags)  $(src)HltConfigSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltConfigclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltConfig.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltConfigclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltConfig
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)HltConfig$(library_suffix).a $(library_prefix)HltConfig$(library_suffix).$(shlibsuffix) HltConfig.stamp HltConfig.shstamp
#-- end of cleanup_library ---------------
