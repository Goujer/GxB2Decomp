using System;
using System.Runtime.InteropServices;
using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class SlotFollower : MonoBehaviour
	{
		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void ColorEventDelegate(Color color);

		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void ActiveEventDelegate(bool isActive);

		public SkeletonRenderer skeletonRenderer;

		[SerializeField]
		public string slotName;

		public bool initializeOnAwake;

		[NonSerialized]
		public bool valid;

		[NonSerialized]
		public Slot slot;

		public UIWidget widget;

		public ColorEventDelegate onColorChange;

		public ActiveEventDelegate onActiveChange;

		private Transform skeletonTransform;

		public bool followVisible;

		public bool followLocalScale;

		public bool followSlotRotation;

		public bool followSkeletonFlip;

		public SkeletonRenderer SkeletonRenderer
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public bool SetSlot(string name)
		{
			return false;
		}

		public void Awake()
		{
		}

		public void HandleRebuildRenderer(SkeletonRenderer skeletonRenderer)
		{
		}

		public void Initialize()
		{
		}

		private void OnDestroy()
		{
		}

		public void addColorEvent(ColorEventDelegate callback)
		{
		}

		public void addActiveEvent(ActiveEventDelegate callback)
		{
		}

		public void clearEvent()
		{
		}

		public void LateUpdate()
		{
		}
	}
}
