using UnityEngine;

namespace BestHTTP.Forms
{
	public sealed class UnityForm : HTTPFormBase
	{
		public WWWForm Form { get; set; }

		public UnityForm()
		{
		}

		public UnityForm(WWWForm form)
		{
		}

		public override void CopyFrom(HTTPFormBase fields)
		{
		}

		public override void PrepareRequest(HTTPRequest request)
		{
		}

		public override byte[] GetData()
		{
			return null;
		}
	}
}
