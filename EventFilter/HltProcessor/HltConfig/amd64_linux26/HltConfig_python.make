#-- start of make_header -----------------

#====================================
#  Document HltConfig_python
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

cmt_HltConfig_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltConfig_python_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltConfig_python

HltConfig_tag = $(tag)

#cmt_local_tagfile_HltConfig_python = $(HltConfig_tag)_HltConfig_python.make
cmt_local_tagfile_HltConfig_python = $(bin)$(HltConfig_tag)_HltConfig_python.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltConfig_tag = $(tag)

#cmt_local_tagfile_HltConfig_python = $(HltConfig_tag).make
cmt_local_tagfile_HltConfig_python = $(bin)$(HltConfig_tag).make

endif

include $(cmt_local_tagfile_HltConfig_python)
#-include $(cmt_local_tagfile_HltConfig_python)

ifdef cmt_HltConfig_python_has_target_tag

cmt_final_setup_HltConfig_python = $(bin)setup_HltConfig_python.make
cmt_dependencies_in_HltConfig_python = $(bin)dependencies_HltConfig_python.in
#cmt_final_setup_HltConfig_python = $(bin)HltConfig_HltConfig_pythonsetup.make
cmt_local_HltConfig_python_makefile = $(bin)HltConfig_python.make

else

cmt_final_setup_HltConfig_python = $(bin)setup.make
cmt_dependencies_in_HltConfig_python = $(bin)dependencies.in
#cmt_final_setup_HltConfig_python = $(bin)HltConfigsetup.make
cmt_local_HltConfig_python_makefile = $(bin)HltConfig_python.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltConfigsetup.make

#HltConfig_python :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltConfig_python'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltConfig_python/
#HltConfig_python::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_python_header ------


installarea = ${CMTINSTALLAREA}
install_python_dir = $(installarea)

ifneq ($(strip "$(source)"),"")
src = ../$(source)
dest = $(install_python_dir)/python
else
src = ../python
dest = $(install_python_dir)
endif

ifneq ($(strip "$(offset)"),"")
dest = $(install_python_dir)/python
endif

HltConfig_python :: HltConfig_pythoninstall

install :: HltConfig_pythoninstall

HltConfig_pythoninstall :: $(install_python_dir)
	@if [ ! "$(installarea)" = "" ] ; then\
	  echo "installation done"; \
	fi

$(install_python_dir) ::
	@if [ "$(installarea)" = "" ] ; then \
	  echo "Cannot install header files, no installation source specified"; \
	else \
	  if [ -d $(src) ] ; then \
	    echo "Installing files from $(src) to $(dest)" ; \
	    if [ "$(offset)" = "" ] ; then \
	      $(install_command) --exclude="*.py?" $(src) $(dest) ; \
	    else \
	      $(install_command) --exclude="*.py?" $(src) $(dest) --destname $(offset); \
	    fi ; \
	  else \
	    echo "no source  $(src)"; \
	  fi; \
	fi

HltConfig_pythonclean :: HltConfig_pythonuninstall

uninstall :: HltConfig_pythonuninstall

HltConfig_pythonuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation source specified"; \
	else \
	  echo "Uninstalling files from $(dest)"; \
	  $(uninstall_command) "$(dest)" ; \
	fi


#-- end of install_python_header ------
#-- start of cleanup_header --------------

clean :: HltConfig_pythonclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltConfig_python.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltConfig_pythonclean ::
#-- end of cleanup_header ---------------
