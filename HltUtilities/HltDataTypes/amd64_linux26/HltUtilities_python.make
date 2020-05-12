#-- start of make_header -----------------

#====================================
#  Document HltUtilities_python
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

cmt_HltUtilities_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltUtilities_python_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltUtilities_python

HltUtilities_tag = $(tag)

#cmt_local_tagfile_HltUtilities_python = $(HltUtilities_tag)_HltUtilities_python.make
cmt_local_tagfile_HltUtilities_python = $(bin)$(HltUtilities_tag)_HltUtilities_python.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltUtilities_tag = $(tag)

#cmt_local_tagfile_HltUtilities_python = $(HltUtilities_tag).make
cmt_local_tagfile_HltUtilities_python = $(bin)$(HltUtilities_tag).make

endif

include $(cmt_local_tagfile_HltUtilities_python)
#-include $(cmt_local_tagfile_HltUtilities_python)

ifdef cmt_HltUtilities_python_has_target_tag

cmt_final_setup_HltUtilities_python = $(bin)setup_HltUtilities_python.make
cmt_dependencies_in_HltUtilities_python = $(bin)dependencies_HltUtilities_python.in
#cmt_final_setup_HltUtilities_python = $(bin)HltUtilities_HltUtilities_pythonsetup.make
cmt_local_HltUtilities_python_makefile = $(bin)HltUtilities_python.make

else

cmt_final_setup_HltUtilities_python = $(bin)setup.make
cmt_dependencies_in_HltUtilities_python = $(bin)dependencies.in
#cmt_final_setup_HltUtilities_python = $(bin)HltUtilitiessetup.make
cmt_local_HltUtilities_python_makefile = $(bin)HltUtilities_python.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltUtilitiessetup.make

#HltUtilities_python :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltUtilities_python'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltUtilities_python/
#HltUtilities_python::
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

HltUtilities_python :: HltUtilities_pythoninstall

install :: HltUtilities_pythoninstall

HltUtilities_pythoninstall :: $(install_python_dir)
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

HltUtilities_pythonclean :: HltUtilities_pythonuninstall

uninstall :: HltUtilities_pythonuninstall

HltUtilities_pythonuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation source specified"; \
	else \
	  echo "Uninstalling files from $(dest)"; \
	  $(uninstall_command) "$(dest)" ; \
	fi


#-- end of install_python_header ------
#-- start of cleanup_header --------------

clean :: HltUtilities_pythonclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltUtilities_python.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltUtilities_pythonclean ::
#-- end of cleanup_header ---------------
