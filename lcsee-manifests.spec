Name:		lcsee-manifests
Version:	0.0.1
Release:	1%{?dist}
Summary:	

License:	
URL:		
Source0:	

BuildRequires:	
Requires:	

%description

Contains manifests for the LCSEE puppet server

%prep
%setup -q


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%files
%doc



%changelog
