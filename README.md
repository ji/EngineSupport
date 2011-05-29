Welcome to EngineSupport
========================

What is it?
-----------

EngineSupport is a helper library for engine driven software (like games, or simulations) for
Apple iOS.

How does it help?
=================

It provides parameters the software can access and react on. Setting of the parameters happens through
a standardized UI.

Usage
=====
Installation
------------

* Clone the repository at github.

	<pre><code>
		git@github.com:ji/EngineSupport.git
	</code></pre>

* Add the contents in the Sources directory to your XCode Project.

Integrate EngineSupport functionality
=====================================

* Define your software parameters.

	Parameters are defined via a property list file in your project. Check out the 
	EngineSupportTest-Parameters.plist file in the EngineSupport project for the exact scheme.
	Also this README will be updated every time another parameter type is added. If you have
	special wishes, please contact me.
	
* Set the parameters filename in your application delegate:

	<code>[Parameters sharedInstance].parametersDefinitionFilename = @"EngineSupportTest-Parameters.plist";</code>
	
* Add a possibility to call the parameters UI (Excerpts from the EngineSupport project):

	Showing the parameters UI:
	<pre><code>
			- (IBAction)showParametersView:(id)_sender
			{
			    if (nil == self.parametersViewController) {
			        self.parametersViewController = [[[ParametersViewController alloc] initWithNibName:@"ParametersViewController"
			                                                                                    bundle:nil] autorelease];
			    }

			    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:self.parametersViewController] 
			                                 autorelease];
			    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
			                                                                                    target:self
			                                                                                    action:@selector(hideParametersView:)];
			    self.parametersViewController.navigationItem.rightBarButtonItem = doneButtonItem;
			    [doneButtonItem release];

			    [self presentModalViewController:self.navigationController animated:YES];
			}
	</code></pre>
	Hiding the parameters UI:

	<pre><code>
		- (IBAction)hideParametersView:(id)_sender
		{
		    [self dismissModalViewControllerAnimated:YES];
		    RELEASE_AND_NIL(parametersViewController);
		}
	</code></pre>

* Access parameters via the Parameters singleton class.

	You can access a parameter value through the Parameters singleton class, like this:

	<pre><code>
		int parameterValue = [[Parameters sharedInstance] valueForParameterWithName:@"ES_TEST_PARAMETER_INTEGER"] intValue];
	</code></pre>

* Define blocks, which will be called on parameter update, like this:

	<pre><code>
		ESParameter *integerParameter = [[Parameters sharedInstance] parameterWithName:@"ES_TEST_PARAMETER_INTEGER"];
		integerParameter.updater = ^(id _parameterValue) { 
	        NSLog(@"Updater for parameter called. New Value is: %d", [_parameterValue intValue]); 
	    };
	</code></pre>

License
=======

EngineSupport is licensed under the MIT license.	

Future features
===============

As EngineSupport is developed in parallel with a private project new features will come in in the next couple of months:

* Searchable parameters UI.
* iPad support.
