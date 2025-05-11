using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class BoundingBoxFollower : MonoBehaviour
	{
		internal static bool DebugMessages;

		public SkeletonRenderer skeletonRenderer;

		public string slotName;

		public bool isTrigger;

		public bool clearStateOnDisable;

		private Slot slot;

		private BoundingBoxAttachment currentAttachment;

		private string currentAttachmentName;

		private PolygonCollider2D currentCollider;

		public readonly Dictionary<BoundingBoxAttachment, PolygonCollider2D> colliderTable;

		public readonly Dictionary<BoundingBoxAttachment, string> nameTable;

		public Slot Slot
		{
			get
			{
				return null;
			}
		}

		public BoundingBoxAttachment CurrentAttachment
		{
			get
			{
				return null;
			}
		}

		public string CurrentAttachmentName
		{
			get
			{
				return null;
			}
		}

		public PolygonCollider2D CurrentCollider
		{
			get
			{
				return null;
			}
		}

		public bool IsTrigger
		{
			get
			{
				return false;
			}
		}

		private void Start()
		{
		}

		private void OnEnable()
		{
		}

		private void HandleRebuild(SkeletonRenderer sr)
		{
		}

		public void Initialize(bool overwrite = false)
		{
		}

		private void AddSkin(Skin skin, int slotIndex)
		{
		}

		private void OnDisable()
		{
		}

		public void ClearState()
		{
		}

		private void DisposeColliders()
		{
		}

		private void LateUpdate()
		{
		}

		private void MatchAttachment(Attachment attachment)
		{
		}
	}
}
