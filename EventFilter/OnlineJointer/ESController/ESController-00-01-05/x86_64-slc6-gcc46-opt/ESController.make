#-- start of make_header -----------------

#====================================
#  Library ESController
#
#   Generated Mon Mar 23 20:57:32 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ESController_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ESController_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ESController

ESController_tag = $(tag)

#cmt_local_tagfile_ESController = $(ESController_tag)_ESController.make
cmt_local_tagfile_ESController = $(bin)$(ESController_tag)_ESController.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ESController_tag = $(tag)

#cmt_local_tagfile_ESController = $(ESController_tag).make
cmt_local_tagfile_ESController = $(bin)$(ESController_tag).make

endif

include $(cmt_local_tagfile_ESController)
#-include $(cmt_local_tagfile_ESController)

ifdef cmt_ESController_has_target_tag

cmt_final_setup_ESController = $(bin)setup_ESController.make
cmt_dependencies_in_ESController = $(bin)dependencies_ESController.in
#cmt_final_setup_ESController = $(bin)ESController_ESControllersetup.make
cmt_local_ESController_makefile = $(bin)ESController.make

else

cmt_final_setup_ESController = $(bin)setup.make
cmt_dependencies_in_ESController = $(bin)dependencies.in
#cmt_final_setup_ESController = $(bin)ESControllersetup.make
cmt_local_ESController_makefile = $(bin)ESController.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ESControllersetup.make

#ESController :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ESController'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ESController/
#ESController::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

ESControllerlibname   = $(bin)$(library_prefix)ESController$(library_suffix)
ESControllerlib       = $(ESControllerlibname).a
ESControllerstamp     = $(bin)ESController.stamp
ESControllershstamp   = $(bin)ESController.shstamp

ESController :: dirs  ESControllerLIB
	$(echo) "ESController ok"

#-- end of libary_header ----------------

ESControllerLIB :: $(ESControllerlib) $(ESControllershstamp)
	@/bin/echo "------> ESController : library ok"

$(ESControllerlib) :: $(bin)Config.o $(bin)SC.o $(bin)factory.o $(bin)ESController_entries.o $(bin)ESController_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(ESControllerlib) $?
	$(lib_silent) $(ranlib) $(ESControllerlib)
	$(lib_silent) cat /dev/null >$(ESControllerstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(ESControllerlibname).$(shlibsuffix) :: $(ESControllerlib) $(ESControllerstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" ESController $(ESController_shlibflags)

$(ESControllershstamp) :: $(ESControllerlibname).$(shlibsuffix)
	@if test -f $(ESControllerlibname).$(shlibsuffix) ; then cat /dev/null >$(ESControllershstamp) ; fi

ESControllerclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)Config.o $(bin)SC.o $(bin)factory.o $(bin)ESController_entries.o $(bin)ESController_load.o

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
ESControllerinstallname = $(library_prefix)ESController$(library_suffix).$(shlibsuffix)

ESController :: ESControllerinstall

install :: ESControllerinstall

ESControllerinstall :: $(install_dir)/$(ESControllerinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(ESControllerinstallname) :: $(bin)$(ESControllerinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(ESControllerinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(ESControllerinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(ESControllerinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(ESControllerinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(ESControllerinstallname) $(install_dir)/$(ESControllerinstallname); \
	      echo `pwd`/$(ESControllerinstallname) >$(install_dir)/$(ESControllerinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(ESControllerinstallname), no installation directory specified"; \
	  fi; \
	fi

ESControllerclean :: ESControlleruninstall

uninstall :: ESControlleruninstall

ESControlleruninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(ESControllerinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(ESControllerinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(ESControllerinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(ESControllerinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ESControllerclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Config.d

$(bin)$(binobj)Config.d :

$(bin)$(binobj)Config.o : $(cmt_final_setup_ESController)

$(bin)$(binobj)Config.o : $(src)Config.cxx
	$(cpp_echo) $(src)Config.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(Config_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(Config_cppflags) $(Config_cxx_cppflags)  $(src)Config.cxx
endif
endif

else
$(bin)ESController_dependencies.make : $(Config_cxx_dependencies)

$(bin)ESController_dependencies.make : $(src)Config.cxx

$(bin)$(binobj)Config.o : $(Config_cxx_dependencies)
	$(cpp_echo) $(src)Config.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(Config_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(Config_cppflags) $(Config_cxx_cppflags)  $(src)Config.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ESControllerclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SC.d

$(bin)$(binobj)SC.d :

$(bin)$(binobj)SC.o : $(cmt_final_setup_ESController)

$(bin)$(binobj)SC.o : $(src)SC.cxx
	$(cpp_echo) $(src)SC.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(SC_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(SC_cppflags) $(SC_cxx_cppflags)  $(src)SC.cxx
endif
endif

else
$(bin)ESController_dependencies.make : $(SC_cxx_dependencies)

$(bin)ESController_dependencies.make : $(src)SC.cxx

$(bin)$(binobj)SC.o : $(SC_cxx_dependencies)
	$(cpp_echo) $(src)SC.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(SC_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(SC_cppflags) $(SC_cxx_cppflags)  $(src)SC.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ESControllerclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)factory.d

$(bin)$(binobj)factory.d :

$(bin)$(binobj)factory.o : $(cmt_final_setup_ESController)

$(bin)$(binobj)factory.o : $(src)factory.cxx
	$(cpp_echo) $(src)factory.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(factory_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(factory_cppflags) $(factory_cxx_cppflags)  $(src)factory.cxx
endif
endif

else
$(bin)ESController_dependencies.make : $(factory_cxx_dependencies)

$(bin)ESController_dependencies.make : $(src)factory.cxx

$(bin)$(binobj)factory.o : $(factory_cxx_dependencies)
	$(cpp_echo) $(src)factory.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(factory_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(factory_cppflags) $(factory_cxx_cppflags)  $(src)factory.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ESControllerclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ESController_entries.d

$(bin)$(binobj)ESController_entries.d :

$(bin)$(binobj)ESController_entries.o : $(cmt_final_setup_ESController)

$(bin)$(binobj)ESController_entries.o : $(src)components/ESController_entries.cxx
	$(cpp_echo) $(src)components/ESController_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(ESController_entries_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(ESController_entries_cppflags) $(ESController_entries_cxx_cppflags) -I../src/components $(src)components/ESController_entries.cxx
endif
endif

else
$(bin)ESController_dependencies.make : $(ESController_entries_cxx_dependencies)

$(bin)ESController_dependencies.make : $(src)components/ESController_entries.cxx

$(bin)$(binobj)ESController_entries.o : $(ESController_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/ESController_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(ESController_entries_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(ESController_entries_cppflags) $(ESController_entries_cxx_cppflags) -I../src/components $(src)components/ESController_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ESControllerclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ESController_load.d

$(bin)$(binobj)ESController_load.d :

$(bin)$(binobj)ESController_load.o : $(cmt_final_setup_ESController)

$(bin)$(binobj)ESController_load.o : $(src)components/ESController_load.cxx
	$(cpp_echo) $(src)components/ESController_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(ESController_load_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(ESController_load_cppflags) $(ESController_load_cxx_cppflags) -I../src/components $(src)components/ESController_load.cxx
endif
endif

else
$(bin)ESController_dependencies.make : $(ESController_load_cxx_dependencies)

$(bin)ESController_dependencies.make : $(src)components/ESController_load.cxx

$(bin)$(binobj)ESController_load.o : $(ESController_load_cxx_dependencies)
	$(cpp_echo) $(src)components/ESController_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ESController_pp_cppflags) $(lib_ESController_pp_cppflags) $(ESController_load_pp_cppflags) $(use_cppflags) $(ESController_cppflags) $(lib_ESController_cppflags) $(ESController_load_cppflags) $(ESController_load_cxx_cppflags) -I../src/components $(src)components/ESController_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: ESControllerclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ESController.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ESControllerclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library ESController
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)ESController$(library_suffix).a $(library_prefix)ESController$(library_suffix).s? ESController.stamp ESController.shstamp
#-- end of cleanup_library ---------------
