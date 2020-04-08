#-- start of make_header -----------------

#====================================
#  Library HltTools
#
#   Generated Mon Mar 23 16:34:03 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltTools_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltTools_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltTools

HltTools_tag = $(tag)

#cmt_local_tagfile_HltTools = $(HltTools_tag)_HltTools.make
cmt_local_tagfile_HltTools = $(bin)$(HltTools_tag)_HltTools.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltTools_tag = $(tag)

#cmt_local_tagfile_HltTools = $(HltTools_tag).make
cmt_local_tagfile_HltTools = $(bin)$(HltTools_tag).make

endif

include $(cmt_local_tagfile_HltTools)
#-include $(cmt_local_tagfile_HltTools)

ifdef cmt_HltTools_has_target_tag

cmt_final_setup_HltTools = $(bin)setup_HltTools.make
cmt_dependencies_in_HltTools = $(bin)dependencies_HltTools.in
#cmt_final_setup_HltTools = $(bin)HltTools_HltToolssetup.make
cmt_local_HltTools_makefile = $(bin)HltTools.make

else

cmt_final_setup_HltTools = $(bin)setup.make
cmt_dependencies_in_HltTools = $(bin)dependencies.in
#cmt_final_setup_HltTools = $(bin)HltToolssetup.make
cmt_local_HltTools_makefile = $(bin)HltTools.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltToolssetup.make

#HltTools :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltTools'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltTools/
#HltTools::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

HltToolslibname   = $(bin)$(library_prefix)HltTools$(library_suffix)
HltToolslib       = $(HltToolslibname).a
HltToolsstamp     = $(bin)HltTools.stamp
HltToolsshstamp   = $(bin)HltTools.shstamp

HltTools :: dirs  HltToolsLIB
	$(echo) "HltTools ok"

#-- end of libary_header ----------------

HltToolsLIB :: $(HltToolslib) $(HltToolsshstamp)
	@/bin/echo "------> HltTools : library ok"

$(HltToolslib) :: $(bin)MessageSvcProvider.o $(bin)PathResolver.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(HltToolslib) $?
	$(lib_silent) $(ranlib) $(HltToolslib)
	$(lib_silent) cat /dev/null >$(HltToolsstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(HltToolslibname).$(shlibsuffix) :: $(HltToolslib) $(HltToolsstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" HltTools $(HltTools_shlibflags)

$(HltToolsshstamp) :: $(HltToolslibname).$(shlibsuffix)
	@if test -f $(HltToolslibname).$(shlibsuffix) ; then cat /dev/null >$(HltToolsshstamp) ; fi

HltToolsclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)MessageSvcProvider.o $(bin)PathResolver.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
HltToolsinstallname = $(library_prefix)HltTools$(library_suffix).$(shlibsuffix)

HltTools :: HltToolsinstall

install :: HltToolsinstall

HltToolsinstall :: $(install_dir)/$(HltToolsinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(HltToolsinstallname) :: $(bin)$(HltToolsinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(HltToolsinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(HltToolsinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(HltToolsinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(HltToolsinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(HltToolsinstallname) $(install_dir)/$(HltToolsinstallname); \
	      echo `pwd`/$(HltToolsinstallname) >$(install_dir)/$(HltToolsinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(HltToolsinstallname), no installation directory specified"; \
	  fi; \
	fi

HltToolsclean :: HltToolsuninstall

uninstall :: HltToolsuninstall

HltToolsuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(HltToolsinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(HltToolsinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(HltToolsinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(HltToolsinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),HltToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)MessageSvcProvider.d

$(bin)$(binobj)MessageSvcProvider.d :

$(bin)$(binobj)MessageSvcProvider.o : $(cmt_final_setup_HltTools)

$(bin)$(binobj)MessageSvcProvider.o : $(src)MessageSvcProvider.cxx
	$(cpp_echo) $(src)MessageSvcProvider.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(HltTools_pp_cppflags) $(lib_HltTools_pp_cppflags) $(MessageSvcProvider_pp_cppflags) $(use_cppflags) $(HltTools_cppflags) $(lib_HltTools_cppflags) $(MessageSvcProvider_cppflags) $(MessageSvcProvider_cxx_cppflags)  $(src)MessageSvcProvider.cxx
endif
endif

else
$(bin)HltTools_dependencies.make : $(MessageSvcProvider_cxx_dependencies)

$(bin)HltTools_dependencies.make : $(src)MessageSvcProvider.cxx

$(bin)$(binobj)MessageSvcProvider.o : $(MessageSvcProvider_cxx_dependencies)
	$(cpp_echo) $(src)MessageSvcProvider.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltTools_pp_cppflags) $(lib_HltTools_pp_cppflags) $(MessageSvcProvider_pp_cppflags) $(use_cppflags) $(HltTools_cppflags) $(lib_HltTools_cppflags) $(MessageSvcProvider_cppflags) $(MessageSvcProvider_cxx_cppflags)  $(src)MessageSvcProvider.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),HltToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PathResolver.d

$(bin)$(binobj)PathResolver.d :

$(bin)$(binobj)PathResolver.o : $(cmt_final_setup_HltTools)

$(bin)$(binobj)PathResolver.o : $(src)PathResolver.cxx
	$(cpp_echo) $(src)PathResolver.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(HltTools_pp_cppflags) $(lib_HltTools_pp_cppflags) $(PathResolver_pp_cppflags) $(use_cppflags) $(HltTools_cppflags) $(lib_HltTools_cppflags) $(PathResolver_cppflags) $(PathResolver_cxx_cppflags)  $(src)PathResolver.cxx
endif
endif

else
$(bin)HltTools_dependencies.make : $(PathResolver_cxx_dependencies)

$(bin)HltTools_dependencies.make : $(src)PathResolver.cxx

$(bin)$(binobj)PathResolver.o : $(PathResolver_cxx_dependencies)
	$(cpp_echo) $(src)PathResolver.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(HltTools_pp_cppflags) $(lib_HltTools_pp_cppflags) $(PathResolver_pp_cppflags) $(use_cppflags) $(HltTools_cppflags) $(lib_HltTools_cppflags) $(PathResolver_cppflags) $(PathResolver_cxx_cppflags)  $(src)PathResolver.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: HltToolsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltTools.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltToolsclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library HltTools
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)HltTools$(library_suffix).a $(library_prefix)HltTools$(library_suffix).s? HltTools.stamp HltTools.shstamp
#-- end of cleanup_library ---------------
