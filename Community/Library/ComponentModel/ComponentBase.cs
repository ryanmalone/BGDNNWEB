﻿#region Copyright
// 
// DotNetNuke® - http://www.dotnetnuke.com
// Copyright (c) 2002-2013
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
#endregion
#region Usings

using System;

#endregion

namespace DotNetNuke.ComponentModel
{
    public abstract class ComponentBase<TContract, TType> where TType : class, TContract
    {
        public static TContract Instance
        {
            get
            {
                var component = ComponentFactory.GetComponent<TContract>();

                if (component == null)
                {
                    component = (TContract) Activator.CreateInstance(typeof (TType), true);
                    ComponentFactory.RegisterComponentInstance<TContract>(component);
                }

                return component;
            }
        }

        public static void RegisterInstance(TContract instance)
        {
            if ((ComponentFactory.GetComponent<TContract>() == null))
            {
                ComponentFactory.RegisterComponentInstance<TContract>(instance);
            }
        }
    }
}