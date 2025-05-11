using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace Spine
{
	public class Skin
	{
		[StructLayout(LayoutKind.Sequential, Size = 24)]
		public struct AttachmentKeyTuple
		{
			public readonly int slotIndex;

			public readonly string name;

			internal readonly int nameHashCode;

			public AttachmentKeyTuple(int slotIndex, string name)
			{
				this.slotIndex = 0;
				this.name = null;
				nameHashCode = 0;
			}
		}

		private class AttachmentKeyTupleComparer : IEqualityComparer<AttachmentKeyTuple>
		{
			internal static readonly AttachmentKeyTupleComparer Instance;

			bool IEqualityComparer<AttachmentKeyTuple>.Equals(AttachmentKeyTuple o1, AttachmentKeyTuple o2)
			{
				return false;
			}

			int IEqualityComparer<AttachmentKeyTuple>.GetHashCode(AttachmentKeyTuple o)
			{
				return 0;
			}
		}

		internal string name;

		private Dictionary<AttachmentKeyTuple, Attachment> attachments;

		public string Name
		{
			get
			{
				return null;
			}
		}

		public Dictionary<AttachmentKeyTuple, Attachment> Attachments
		{
			get
			{
				return null;
			}
		}

		public Skin(string name)
		{
		}

		public void AddAttachment(int slotIndex, string name, Attachment attachment)
		{
		}

		public Attachment GetAttachment(int slotIndex, string name)
		{
			return null;
		}

		public void SwitchAttachment(int slotIndex, string name1, string name2)
		{
		}

		public void FindNamesForSlot(int slotIndex, List<string> names)
		{
		}

		public void FindAttachmentsForSlot(int slotIndex, List<Attachment> attachments)
		{
		}

		public override string ToString()
		{
			return null;
		}

		internal void AttachAll(Skeleton skeleton, Skin oldSkin)
		{
		}
	}
}
