use inc::Module::Install;

RTx     'RT-Extension-DefaultSearchFilter';
license 'gpl_2';
repository 'https://github.com/bestpractical/rt-extension-defaultsearchfilter';

requires_rt '4.2.0';
rt_too_new '4.6.0';

sign;
WriteAll;
