using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	[ExecuteInEditMode]
	public class SkeletonRenderSeparator : MonoBehaviour
	{
		public const int DefaultSortingOrderIncrement = 5;

		[SerializeField]
		protected SkeletonRenderer skeletonRenderer;

		private MeshRenderer mainMeshRenderer;

		public bool copyPropertyBlock;

		public bool copyMeshRendererFlags;

		public List<SkeletonPartsRenderer> partsRenderers;

		public int lrQueue;

		public int curSortingOrder;

		public int sortingOrderDuration;

		private MaterialPropertyBlock copiedBlock;

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

		public int lastRenderQueue
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public int sortingOrder
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public static SkeletonRenderSeparator AddToSkeletonRenderer(SkeletonRenderer skeletonRenderer, int sortingLayerID = 0, int extraPartsRenderers = 0, int sortingOrderIncrement = 5, int baseSortingOrder = 0, bool addMinimumPartsRenderers = true)
		{
			return null;
		}

		public void AddPartsRenderer(int sortingOrderIncrement = 5)
		{
		}

		private void OnEnable()
		{
		}

		public void updateQueue()
		{
		}

		public void updateSortingOrder()
		{
		}

		public void setSeparatorDuration(int num)
		{
		}

		private void OnDisable()
		{
		}

		private void HandleRender(SkeletonRendererInstruction instruction)
		{
		}
	}
}
