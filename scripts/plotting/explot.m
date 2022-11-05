  function[varargout] = explot(varargin)
% function[varargout] = explot(varargin)
% Implements the matlab plot function, but does some 
% modification of the plot so that it's readable upon
% export. This routine was written by Akil Narayan.
hand = plot(varargin{:});
for q = 1:length(hand);
  set(hand,'LineWidth',2);
  set(hand,'MarkerSize',12);
end
set(gca, 'FontSize', 16, 'FontWeight', 'n');
if nargout>=1;
  varargout{1} = hand;
end
