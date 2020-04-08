#-- start of make_header -----------------

#====================================
#  Application TPathResolver
#
#   Generated Mon Mar 23 16:34:16 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TPathResolver_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TPathResolver_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TPathResolver

HltTools_tag = $(tag)

#cmt_local_tagfile_TPathResolver = $(HltTools_tag)_TPathResolver.make
cmt_local_tagfile_TPathResolver = $(bin)$(HltTools_tag)_TPathResolver.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltTools_tag = $(tag)

#cmt_local_tagfile_TPathResolver = $(HltTools_tag).make
cmt_local_tagfile_TPathResolver = $(bin)$(HltTools_tag).make

endif

include $(cmt_local_tagfile_TPathResolver)
#-include $(cmt_local_tagfile_TPathResolver)

ifdef cmt_TPathResolver_has_target_tag

cmt_final_setup_TPathResolver = $(bin)setup_TPathResolver.make
cmt_dependencies_in_TPathResolver = $(bin)dependencies_TPathResolver.in
#cmt_final_setup_TPathResolver = $(bin)HltTools_TPathResolversetup.make
cmt_local_TPathResolver_makefile = $(bin)TPathResolver.make

else

cmt_final_setup_TPathResolver = $(bin)setup.make
cmt_dependencies_in_TPathResolver = $(bin)dependencies.in
#cmt_final_setup_TPathResolver = $(bin)HltToolssetup.make
cmt_local_TPathResolver_makefile = $(bin)TPathResolver.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltToolssetup.make

#TPathResolver :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TPathResolver'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TPathResolver/
#TPathResolver::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

TPathResolver :: dirs  $(bin)TPathResolver${application_suffix}
	$(echo) "TPathResolver ok"

#-- end of application_header

$(bin)TPathResolver${application_suffix} :: $(bin)TPathResolver.o $(use_stamps) $(TPathResolverstamps) $(cmt_final_setup_TPathResolver)
	$(link_echo) $@
	$(link_silent) cd $(bin); $(cpplink) -o TPathResolver.exe.new $(bin)TPathResolver.o $(use_linkopts) $(TPathResolverlinkopts); mv -f TPathResolver.exe.new TPathResolver${application_suffix}


###
### Preparing for next management of use_linkopts and auto_imports :
###  will use  <constituent>_use_linkopts instead of use_linkopts
###
###	$(link_silent) cd $(bin); \
###	  $(cpplink) -o TPathResolver.exe.new $(bin)TPathResolver.o \
###	  $(TPathResolver_use_linkopts) $(TPathResolverlinkopts); \
###	  mv -f TPathResolver.exe.new TPathResolver${application_suffix}
###

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

install_dir = ${installarea}/${CMTCONFIG}/bin
TPathResolverinstallname = TPathResolver${application_suffix}

TPathResolver :: TPathResolverinstall

install :: TPathResolverinstall

TPathResolverinstall :: $(install_dir)/$(TPathResolverinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(TPathResolverinstallname) :: $(bin)$(TPathResolverinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing application $(TPathResolverinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(TPathResolverinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(TPathResolverinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(TPathResolverinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(TPathResolverinstallname) $(install_dir)/$(TPathResolverinstallname); \
	      echo `pwd`/$(TPathResolverinstallname) >$(install_dir)/$(TPathResolverinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install application $(TPathResolverinstallname), no installation directory specified"; \
	  fi; \
	fi

TPathResolverclean :: TPathResolveruninstall

uninstall :: TPathResolveruninstall

TPathResolveruninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed application $(TPathResolverinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(TPathResolverinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(TPathResolverinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall application $(TPathResolverinstallname), no installation directory specified"; \
	  fi; \
	fi

#-- start of cpp ------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TPathResolverclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TPathResolver.d

$(bin)$(binobj)TPathResolver.d :

$(bin)$(binobj)TPathResolver.o : $(cmt_final_setup_TPathResolver)

$(bin)$(binobj)TPathResolver.o : ../test/TPathResolver.cxx
	$(cpp_echo) ../test/TPathResolver.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TPathResolver_pp_cppflags) $(app_TPathResolver_pp_cppflags) $(TPathResolver_pp_cppflags) $(use_cppflags) $(TPathResolver_cppflags) $(app_TPathResolver_cppflags) $(TPathResolver_cppflags) $(TPathResolver_cxx_cppflags) -I../test ../test/TPathResolver.cxx
endif
endif

else
$(bin)TPathResolver_dependencies.make : $(TPathResolver_cxx_dependencies)

$(bin)TPathResolver_dependencies.make : ../test/TPathResolver.cxx

$(bin)$(binobj)TPathResolver.o : $(TPathResolver_cxx_dependencies)
	$(cpp_echo) ../test/TPathResolver.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TPathResolver_pp_cppflags) $(app_TPathResolver_pp_cppflags) $(TPathResolver_pp_cppflags) $(use_cppflags) $(TPathResolver_cppflags) $(app_TPathResolver_cppflags) $(TPathResolver_cppflags) $(TPathResolver_cxx_cppflags) -I../test ../test/TPathResolver.cxx

endif

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: TPathResolverclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TPathResolver.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TPathResolverclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application TPathResolver
	-$(cleanup_silent) cd $(bin); /bin/rm -f TPathResolver${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects TPathResolver
	-$(cleanup_silent) /bin/rm -f $(bin)TPathResolver.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TPathResolver.o) $(patsubst %.o,%.dep,$(bin)TPathResolver.o) $(patsubst %.o,%.d.stamp,$(bin)TPathResolver.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf TPathResolver_deps TPathResolver_dependencies.make
#-- end of cleanup_objects ------
