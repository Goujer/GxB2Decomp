using System.Runtime.InteropServices;
using UnityEngine;

[StructLayout(LayoutKind.Auto, Size = 8)]
public delegate void ApplicationInputDelegate(KeyCode keyCode);
